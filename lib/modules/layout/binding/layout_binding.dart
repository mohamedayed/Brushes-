import 'package:brushes/modules/account/controller/account_controller.dart';

import '../../../di_container.dart';
import 'package:get/get.dart';

import '../../booking/controller/my_bookings_controller.dart';
import '../../chat/controller/chat_controller.dart';
import '../../home/controller/home_controller.dart';
import '../controller/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<LayoutController>());
    Get.lazyPut(() => sl<HomeController>());
    Get.lazyPut(() => sl<MyBookingsController>());
    Get.lazyPut(() => sl<ChatController>());
    Get.lazyPut(() => sl<AccountController>());
  }
}
