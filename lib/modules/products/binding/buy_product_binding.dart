import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/buy_product_controller.dart';

class BuyProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<BuyProductController>());
  }
}
