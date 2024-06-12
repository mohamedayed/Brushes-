import 'dart:io';

import 'package:brushes/core/utils/constants.dart';
import 'package:brushes/modules/chat/models/responses/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../models/responses/message_model.dart';

class ChatRepo extends BaseRepository {
  final ApiClient _apiClient;

  ChatRepo(this._apiClient, super.networkInfo);

  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance.collection(FirebaseFireStoreKeys.usersCollection).add(userData).catchError((e) {
      print(e.toString());
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserInfo(String token) async {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.usersCollection)
        .where(FirebaseFireStoreKeys.token, isEqualTo: token)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.usersCollection)
        .where(FirebaseFireStoreKeys.userName, isEqualTo: searchField)
        .get();
  }

  Future<void> createChat(Chat chat) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chat.id)
        .set(chat.toJson())
        .catchError((e) {
      print(e);
    });
  }

  Future<void> deleteChat(Chat chat) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chat.id)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  Stream<QuerySnapshot> getUserChats(int userId, {perPage = 10}) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .where(FirebaseFireStoreKeys.visibleToUsers, arrayContains: userId)
        .orderBy(FirebaseFireStoreKeys.time, descending: true)
        .limit(perPage)
        .snapshots();
  }

  Future<Chat> getChat(Chat chat) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chat.id)
        .get()
        .then((value) {
      return Chat.fromDocumentSnapshot(value);
    });
  }

  Stream<QuerySnapshot> getUserChatsStartAt(int userId, DocumentSnapshot lastDocument, {perPage = 10}) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .where(FirebaseFireStoreKeys.visibleToUsers, arrayContains: userId)
        .orderBy(FirebaseFireStoreKeys.time, descending: true)
        .startAfterDocument(lastDocument)
        .limit(perPage)
        .snapshots();
  }

  Stream<List<Message>> getMessages(Chat chat) {
    updateChat(chat.id!, {FirebaseFireStoreKeys.readByUsers: chat.readByUsers});
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chat.id)
        .collection(FirebaseFireStoreKeys.messagesCollection)
        .orderBy(FirebaseFireStoreKeys.time, descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Message> retVal = [];
      for (var element in query.docs) {
        retVal.add(Message.fromDocumentSnapshot(element));
      }
      return retVal;
    });
  }

  Future<void> addMessage(Chat chat, Message message) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chat.id)
        .collection(FirebaseFireStoreKeys.messagesCollection)
        .add(message.toJson())
        .whenComplete(() {
      updateChat(chat.id!, chat.toUpdatedMap());
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> updateChat(String chatId, Map<String, dynamic> chat) {
    return FirebaseFirestore.instance
        .collection(FirebaseFireStoreKeys.chatsCollection)
        .doc(chatId.toString())
        .update(chat)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<String> uploadFile(File imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(imageFile);
    return uploadTask.then((TaskSnapshot storageTaskSnapshot) {
      return storageTaskSnapshot.ref.getDownloadURL();
    }, onError: (e) {
      throw Exception(e.toString());
    });
  }
}
