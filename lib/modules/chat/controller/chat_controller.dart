import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/alerts.dart';
import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/core/utils/pickers.dart';
import 'package:brushes/modules/chat/models/responses/chat_model.dart';
import 'package:brushes/modules/chat/models/responses/message_model.dart';
import 'package:brushes/modules/notifications/repositories/notifications_repo.dart';
import 'package:brushes/modules/profile/models/responses/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../repositories/chat_repo.dart';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatController extends GetxController {
  final ChatRepo _chatRepo;
  final NotificationsRepo _notificationsRepo;

  ChatController(this._chatRepo, this._notificationsRepo);

  RxBool isUploading = false.obs;
  RxBool isLoading = true.obs;
  RxBool isDone = false.obs;
  Rx<Chat> chat = Chat(users: []).obs;
  RxList<Chat> chats = <Chat>[].obs;
  RxList<Message> messages = <Message>[].obs;
  File? imageFile;
  Rx<DocumentSnapshot?> lastDocument = Rx<DocumentSnapshot?>(null);
  ScrollController scrollController = ScrollController();
  final GlobalKey<AnimatedListState> messagesListKey = GlobalKey<AnimatedListState>();
  final TextEditingController chatTextController = TextEditingController();

  @override
  void onInit() async {
    listenForChats();
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isDone.value) {
        await listenForChats();
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    chatTextController.dispose();
  }

  Future createChat(Chat chat) async {
    chat.users?.insert(0, currentUser.value!);
    chat.lastMessageTime = DateTime.now().millisecondsSinceEpoch;
    chat.readByUsers = [currentUser.value!.id];
    this.chat(chat);
    _chatRepo.createChat(chat).then((value) {
      listenForMessages();
    });
  }

  Future deleteChat(Chat chat) async {
    chats.remove(chat);
    await _chatRepo.deleteChat(chat);
  }

  Future refreshChats() async {
    chats.clear();
    lastDocument = Rx<DocumentSnapshot?>(null);
    await listenForChats();
  }

  Future<void> listenForChats() async {
    isLoading.value = true;
    isDone.value = false;
    Stream<QuerySnapshot> userChats;
    if (lastDocument.value == null) {
      userChats = _chatRepo.getUserChats(currentUser.value!.id);
    } else {
      userChats = _chatRepo.getUserChatsStartAt(currentUser.value!.id, lastDocument.value!);
    }
    userChats.listen((QuerySnapshot query) {
      if (query.docs.isNotEmpty) {
        for (var element in query.docs) {
          final alreadyFound = chats.map((chat) => chat.id).toList().contains(element.id);
          chats.addIf(!alreadyFound, Chat.fromDocumentSnapshot(element));
        }
        lastDocument.value = query.docs.last;
      } else {
        isDone.value = true;
      }
      isLoading.value = false;
    });
  }

  Future<void> listenForMessages() async {
    messages.clear();
    chat.value = await _chatRepo.getChat(chat.value);
    chat.value.readByUsers?.add(currentUser.value!.id);
    _chatRepo.getMessages(chat.value).listen((event) {
      messages.assignAll(event);
    });
  }

  void addMessage(Chat chat, String text) {
    Message message = Message(text, DateTime.now().millisecondsSinceEpoch, currentUser.value!.id, currentUser.value!);
    if (chat.id == null) {
      chat.id = UniqueKey().toString();
      createChat(chat);
    }
    chat.lastMessage = text;
    chat.lastMessageTime = message.time;
    chat.readByUsers = [currentUser.value!.id];
    isUploading(false);
    _chatRepo.addMessage(chat, message).then((value) {}).then((value) {
      List<UserModel> users = [];
      users.addAll(chat.users ?? []);
      users.removeWhere((element) => element.id == currentUser.value!.id);
      _notificationsRepo.sendNotification(
          users, currentUser.value!, "App\\Notifications\\NewMessage", text, message.id);
    });
  }

  Future getImage(BuildContext context, ImageSource source) async {
    imageFile = await Pickers.pickImage(context, fromGallery: source == ImageSource.gallery);

    if (imageFile != null) {
      try {
        isUploading(true);
        return await _chatRepo.uploadFile(imageFile!);
      } catch (e) {
        Alerts.showSnackBar(message: e.toString());
      }
    } else {
      Alerts.showSnackBar(message: AppStrings.pleaseUploadImage.tr);
    }
  }
}
