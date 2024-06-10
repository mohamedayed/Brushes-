import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ThemeController>());
  }
}
