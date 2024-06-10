import '../../../di_container.dart';
import '../controller/otp_controller.dart';
import 'package:get/get.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<OTPController>());
  }
}
