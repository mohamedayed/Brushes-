import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<AccountController>());
  }
}
