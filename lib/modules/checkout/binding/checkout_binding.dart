import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<CheckoutController>());
  }
}
