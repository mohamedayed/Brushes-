
import '../../../di_container.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';
import '../controller/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<LayoutController>());
    Get.lazyPut(() => sl<HomeController>());
  }
}
