import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<CategoriesController>());
  }
}
