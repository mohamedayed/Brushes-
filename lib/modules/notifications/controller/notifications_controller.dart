import 'package:get/get.dart';

import '../repositories/notifications_repo.dart';

class NotificationsController extends GetxController {
  final NotificationsRepo _notificationsRepo;

  NotificationsController(this._notificationsRepo);
}
