import '../../../di_container.dart';
import '../controller/new_password_controller.dart';
import 'package:get/get.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<NewPasswordController>());
  }
}
