import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/core/view/widgets/custom_text.dart';
import 'package:brushes/modules/profile/models/responses/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart' show DateFormat;
import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../models/responses/chat_model.dart';

class ChatTile extends StatelessWidget {
  final Chat chat;
  final ValueChanged<Chat> onDismissed;

  const ChatTile({required this.chat, required this.onDismissed, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.chatScreen, arguments: chat),
      child: Row(
        children: [
          CustomImage(
            image: chat.users
                    ?.firstWhere((user) => user.id != currentUser.value!.id, orElse: () => UserModel.fromJson({}))
                    .avatar
                    .thumb ??
                "",
            width: 64,
            height: 64,
            borderRadius: 250,
          ),
          HorizontalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        chat.name ?? "",
                        fontWeight: FontWeightManager.bold,
                        maxLines: 1,
                      ),
                    ),
                    if (chat.lastMessageTime != null) const HorizontalSpace(4),
                    if (chat.lastMessageTime != null)
                      CustomText(
                        DateFormat('HH:mm', Get.locale.toString())
                            .format(DateTime.fromMillisecondsSinceEpoch(chat.lastMessageTime!)),
                        color: AppColors.primary,
                        fontSize: FontSize.s12,
                      )
                  ],
                ),
                VerticalSpace(4),
                Row(
                  children: [
                    if (chat.lastMessage!.isURL)
                      Expanded(
                        child: Wrap(
                          spacing: 5,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.link, size: 20, color: Get.theme.focusColor),
                            CustomText(
                              AppStrings.imageOrUrl.tr,
                              maxLines: 2,
                              fontWeight: chat.readByUsers != null && chat.readByUsers!.contains(currentUser.value!.id)
                                  ? FontWeightManager.regular
                                  : FontWeightManager.bold,
                            )
                          ],
                        ),
                      )
                    else
                      Expanded(
                        child: CustomText(
                          chat.lastMessage ?? "",
                          fontSize: FontSize.s12,
                          maxLines: 2,
                          color: AppColors.grey,
                        ),
                      ),
                  ],
                ),
                if (chat.lastMessageTime != null) VerticalSpace(4),
                if (chat.lastMessageTime != null)
                  CustomText(
                    DateFormat('dd-MM-yyyy', Get.locale.toString())
                        .format(DateTime.fromMillisecondsSinceEpoch(chat.lastMessageTime!)),
                    fontSize: FontSize.s12,
                    maxLines: 2,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
