import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/e_service_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<EServiceDetailsController>());
  }
}
