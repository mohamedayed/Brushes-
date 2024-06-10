import '../../../di_container.dart';
import '../controller/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ForgetPasswordController>());
  }
}
