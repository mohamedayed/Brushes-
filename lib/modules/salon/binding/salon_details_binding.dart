import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/salon_details_controller.dart';

class SalonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<SalonDetailsController>());
  }
}
