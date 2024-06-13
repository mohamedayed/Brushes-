import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../controller/notifications_controller.dart';
import '../../models/responses/notification_model.dart' as model;
import 'notification_item_widget.dart';

class BookingNotificationItemWidget extends GetView<NotificationsController> {
  final model.Notification notification;

  const BookingNotificationItemWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return NotificationItemWidget(
      notification: notification,
      onDismissed: (notification) {
        controller.removeNotification(notification);
      },
      icon: Icon(
        Icons.assignment_outlined,
        color: Get.theme.scaffoldBackgroundColor,
        size: 34,
      ),
      onTap: (notification) async {
        Get.toNamed(Routes.bookingDetailsScreen, arguments: {"id": notification.data['booking_id']});
        controller.markAsReadNotification(notification);
      },
    );
  }
}
