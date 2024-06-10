import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<NotificationsController>());
  }
}
