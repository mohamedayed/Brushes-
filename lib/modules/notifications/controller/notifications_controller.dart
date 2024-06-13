import 'package:brushes/core/services/notifications/notifications_service.dart';
import 'package:brushes/modules/notifications/models/responses/notification_model.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../repositories/notifications_repo.dart';

class NotificationsController extends GetxController {
  final NotificationsRepo _notificationsRepo;
  final NotificationsService _notificationsService;

  NotificationsController(this._notificationsRepo, this._notificationsService);

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  RxBool isLoading = false.obs;
  RxList<Notification> notifications = <Notification>[].obs;

  Future<void> getNotifications() async {
    isLoading(true);
    final result = await _notificationsRepo.getNotifications();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getNotifications),
      (notifications) => this.notifications(notifications),
    );
    isLoading(false);
  }

  Future<void> removeNotification(Notification notification) async {
    final result = await _notificationsRepo.removeNotification(notification.id);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (notification) {
        notifications.removeWhere((element) => element.id == notification.id);
        if (!notification.read) {
          _notificationsService.setCurrentNotificationsCount(NotificationsService.currentNotificationsCount.value - 1);
        }
        notifications.refresh();
      },
    );
  }

  Future<void> markAsReadNotification(Notification notification) async {
    final result = await _notificationsRepo.markAsReadNotification(notification);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (notification) {
        notification.read = true;
        _notificationsService.setCurrentNotificationsCount(NotificationsService.currentNotificationsCount.value - 1);
        notifications.refresh();
      },
    );
  }
}
