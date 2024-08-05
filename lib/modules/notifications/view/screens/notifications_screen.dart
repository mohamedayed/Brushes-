import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/booking_notification_item_widget.dart';
import '../widgets/notification_item_widget.dart';

class NotificationsScreen extends GetWidget<NotificationsController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.notifications.tr),
      body: Obx(
        () {
          return controller.isLoading.value
              ? const LoadingSpinner()
              : controller.notifications.isEmpty
                  ? CustomEmptyListPageWidget(title: AppStrings.noNotifications.tr)
                  : ListView.separated(
                      itemCount: controller.notifications.length,
                      separatorBuilder: (context, index) => const VerticalSpace(AppSize.s12),
                      itemBuilder: (context, index) {
                        final notification = controller.notifications[index];
                        if (notification.data['message_id'] != null) {
                          return const SizedBox.shrink();
                        } else if (notification.data['booking_id'] != null) {
                          return BookingNotificationItemWidget(notification: notification);
                        } else {
                          return NotificationItemWidget(
                            notification: notification,
                            onDismissed: (notification) => controller.removeNotification(notification),
                            onTap: (notification) => controller.markAsReadNotification(notification),
                          );
                        }
                      },
                    );
        },
      ),
    );
  }
}
