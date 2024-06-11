import 'package:brushes/modules/booking/models/requests/booking_body.dart';
import 'package:get/get.dart';

class BookingSummaryController extends GetxController {
  late final BookingBody bookingBody;

  @override
  void onInit() {
    super.onInit();
    bookingBody = Get.arguments["booking_body"];
  }
}
