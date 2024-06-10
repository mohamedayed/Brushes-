import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ProductDetailsController>());
  }
}
