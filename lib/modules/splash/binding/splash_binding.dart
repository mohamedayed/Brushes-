import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<SplashController>());
  }
}
