import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/responses/notification_model.dart' as model;

class NotificationItemWidget extends StatelessWidget {
  final model.Notification notification;
  final ValueChanged<model.Notification> onDismissed;
  final ValueChanged<model.Notification> onTap;
  final Widget? icon;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.onDismissed,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(notification.hashCode.toString()),
      background: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.warning,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.delete_outline, color: Colors.white),
          ),
        ),
      ),
      onDismissed: (direction) => onDismissed(notification),
      child: GestureDetector(
        onTap: () => onTap(notification),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: notification.read ? AppColors.primary.withOpacity(0.15) : AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 62,
                    height: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          notification.read ? AppColors.primary.withOpacity(1) : AppColors.primary.withOpacity(0.6),
                          notification.read ? AppColors.primary.withOpacity(0.2) : AppColors.primary.withOpacity(0.1),
                          // Get.theme.focusColor.withOpacity(0.2),
                        ],
                      ),
                    ),
                    child:
                        icon ?? Icon(Icons.notifications_outlined, color: Get.theme.scaffoldBackgroundColor, size: 38),
                  ),
                  Positioned(
                    right: -15,
                    bottom: -30,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    top: -55,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    CustomText(
                      notification.getMessage(),
                      maxLines: 3,
                      color: notification.read ? AppColors.primary : AppColors.white,
                      fontWeight: notification.read ? FontWeight.w600 : FontWeight.w300,
                    ),
                    CustomText(
                      DateFormat('d, MMMM y | HH:mm', Get.locale.toString()).format(notification.createdAt),
                      fontWeight: FontWeightManager.bold,
                      color: notification.read ? AppColors.primary : AppColors.white,
                      fontSize: FontSize.s10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
