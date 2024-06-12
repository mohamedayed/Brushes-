import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/chat/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/chat_tile.dart';

class ChatsScreen extends GetWidget<ChatController> {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainAppbar(title: AppStrings.chats.tr, showDefaultBackButton: false),
        Expanded(
          child: Obx(
            () {
              if (controller.chats.isNotEmpty) {
                final chats = controller.chats;
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: controller.scrollController,
                  itemCount: chats.length,
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => ChatTile(
                    chat: chats[index],
                    onDismissed: (conversation) => controller.deleteChat(chats[index]),
                  ),
                );
              } else {
                return CircularLoadingAnimated(
                  height: Get.height,
                  onCompleteText: AppStrings.chatsEmpty.tr,
                  onComplete: (value) {},
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
