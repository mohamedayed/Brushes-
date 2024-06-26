import '../../../di_container.dart';
import '../controller/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<SignUpController>());
  }
}
