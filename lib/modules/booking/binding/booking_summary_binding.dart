import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controller/booking_summary_controller.dart';

class BookingSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<BookingSummaryController>());
  }
}
