import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controller/category_services_controller.dart';

class CategoryServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<CategoryServicesController>());
  }
}
