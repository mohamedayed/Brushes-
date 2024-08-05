import 'dart:async';
import 'dart:io';

import '../../../../core/utils/constants.dart';
import '../../controller/chat_controller.dart';
import '../../models/responses/chat_model.dart';
import '../../models/responses/message_model.dart';
import '../../../profile/models/responses/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends GetWidget<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.chat.value = Get.arguments as Chat;
    if (controller.chat.value.id != null) controller.listenForMessages();

    return Scaffold(
      appBar: CustomAppbar(
        elevation: 1,
        bgColor: AppColors.white,
        centerTitle: true,
        title: Column(
          children: [
            CustomText(Constants.appName, fontWeight: FontWeight.w700, fontSize: 24),
            CustomText("لخدمات الصالون", fontSize: 11, fontWeight: FontWeight.w400),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () {
                  if (controller.messages.isEmpty) {
                    return CircularLoadingAnimated(
                      height: Get.height,
                      onCompleteText: AppStrings.typeMessageToStartChatting.tr,
                      onComplete: (value) {},
                    );
                  } else {
                    return ListView.separated(
                      // key: controller.messagesListKey,
                      reverse: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      itemCount: controller.messages.length,
                      primary: true,
                      separatorBuilder: (context, index) => VerticalSpace(AppSize.s8),
                      itemBuilder: (context, index) {
                        Message message = controller.messages.elementAt(index);
                        message.user = controller.chat.value.users?.firstWhere(
                          (element) => element.id == message.userId,
                          orElse: () => UserModel.fromJson({"name": "-"}),
                        );
                        return MessageBubble(message: message);
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              // height: AppSize.s72,
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p12),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: Platform.isIOS
                    ? null
                    : [BoxShadow(offset: Offset(0, 0), color: AppColors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.addMessage(controller.chat.value, controller.chatTextController.text);
                      Timer(Duration(milliseconds: 100), () => controller.chatTextController.clear());
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(5)),
                      child: const CustomIcon.svg(AppIcons.send, size: 18),
                    ),
                  ),
                  HorizontalSpace(8),
                  Expanded(
                    child: Center(
                      child: CustomTextField(
                        controller: controller.chatTextController,
                        hintText: AppStrings.typeToStartChatting.tr,
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () async {
                                var imageUrl = await controller.getImage(context, ImageSource.camera);
                                if (imageUrl != null && imageUrl.trim() != '') {
                                  controller.addMessage(controller.chat.value, imageUrl);
                                }
                                Timer(Duration(milliseconds: 100), () {
                                  controller.chatTextController.clear();
                                });
                              },
                              child: CustomIcon.svg(AppIcons.camera),
                            ),
                            HorizontalSpace(12),
                            InkWell(
                              onTap: () async {
                                var imageUrl = await controller.getImage(context, ImageSource.gallery);
                                if (imageUrl != null && imageUrl.trim() != '') {
                                  controller.addMessage(controller.chat.value, imageUrl);
                                }
                                Timer(Duration(milliseconds: 100), () => controller.chatTextController.clear());
                              },
                              child: CustomIcon.svg(AppIcons.image),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
