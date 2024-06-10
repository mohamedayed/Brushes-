import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/employee_details_controller.dart';

class EmployeeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<EmployeeDetailsController>());
  }
}
