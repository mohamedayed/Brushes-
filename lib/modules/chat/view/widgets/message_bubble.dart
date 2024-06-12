import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/core/view/widgets/custom_text.dart';
import 'package:brushes/modules/chat/models/responses/message_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart' show DateFormat;

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    if (currentUser.value!.id == message.userId) {
      if ((message.text ?? "").isURL) {
        return getSentMessageImageLayout(context);
      } else {
        return getSentMessageTextLayout(context);
      }
    } else {
      if ((message.text ?? "").isURL) {
        return getReceivedMessageImageLayout(context);
      } else {
        return getReceivedMessageTextLayout(context);
      }
    }
  }

  Widget getSentMessageTextLayout(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomText(message.user?.name ?? "", fontWeight: FontWeightManager.bold),
                      CustomText(message.text ?? ""),
                    ],
                  ),
                ),
                HorizontalSpace(AppSize.s8),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  width: 42,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(42)),
                    child: CustomImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: message.user?.avatar.thumb ?? "",
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomText(
            DateFormat('d, MMMM y | HH:mm', Get.locale.toString()).format(
              DateTime.fromMillisecondsSinceEpoch(message.time ?? 0),
            ),
            fontSize: FontSize.s10,
          )
        ],
      ),
    );
  }

  Widget getSentMessageImageLayout(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomText(message.user?.name ?? "", fontWeight: FontWeightManager.bold),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.GALLERY, arguments: {
                            //   'media': [new Media(id: message.text ?? "", url: message.text ?? "")],
                            //   'current': new Media(id: message.text ?? "", url: message.text ?? ""),
                            //   'heroTag': 'chat_image'
                            // });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: CustomImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 200,
                              image: message.text ?? "",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HorizontalSpace(AppSize.s8),
                Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  width: 42,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(42)),
                    child: CustomImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: message.user?.avatar.thumb ?? "",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              DateFormat('d, MMMM y | HH:mm', Get.locale.toString())
                  .format(DateTime.fromMillisecondsSinceEpoch(message.time ?? 0)),
             fontSize: FontSize.s10,
            ),
          )
        ],
      ),
    );
  }

  Widget getReceivedMessageTextLayout(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 42,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(42)),
                    child: CustomImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: message.user?.avatar.thumb ?? "",
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(message.user?.name ?? "",
                          style: Get.textTheme.bodyMedium
                              ?.merge(TextStyle(fontWeight: FontWeight.w600, color: Get.theme.primaryColor))),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          message.text ?? "",
                          style: Get.textTheme.bodyLarge?.merge(TextStyle(color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              DateFormat('HH:mm | d, MMMM y', Get.locale.toString())
                  .format(DateTime.fromMillisecondsSinceEpoch(message.time ?? 0)),
              overflow: TextOverflow.fade,
              softWrap: false,
              style: Get.textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }

  Widget getReceivedMessageImageLayout(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 42,
                  height: 42,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(42)),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: message.user?.avatar.thumb ?? "",
                      placeholder: (context, url) => Image.asset(
                        'assets/img/loading.gif',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error_outline),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(message.user?.name ?? "",
                          style: Get.textTheme.bodyMedium
                              ?.merge(TextStyle(fontWeight: FontWeight.w600, color: Get.theme.primaryColor))),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: InkWell(
                          onTap: () {
                            // Get.toNamed(Routes.GALLERY, arguments: {
                            //   'media': [new Media(id: message.text ?? "", url: message.text ?? "")],
                            //   'current': new Media(id: message.text ?? "", url: message.text ?? ""),
                            //   'heroTag': 'chat_image'
                            // });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              height: 200,
                              imageUrl: message.text ?? "",
                              placeholder: (context, url) => Image.asset(
                                'assets/img/loading.gif',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.link_outlined),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              DateFormat('HH:mm | d, MMMM y', Get.locale.toString())
                  .format(DateTime.fromMillisecondsSinceEpoch(message.time ?? 0)),
              overflow: TextOverflow.fade,
              softWrap: false,
              style: Get.textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
