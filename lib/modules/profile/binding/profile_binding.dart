import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ProfileController>());
  }
}
