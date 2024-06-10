import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/addresses_controller.dart';

class AddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<AddressesController>());
  }
}
