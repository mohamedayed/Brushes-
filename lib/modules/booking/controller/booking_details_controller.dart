import 'package:brushes/modules/booking/models/responses/booking_model.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../repositories/booking_repo.dart';

class BookingDetailsController extends GetxController {
  final BookingRepo _bookingRepo;

  BookingDetailsController(this._bookingRepo);

  Rx<Booking?> booking = Rx<Booking?>(null);
  RxBool isLoading = false.obs;
  late final int id;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    getBooking();
  }

  Future<void> getBooking() async {
    isLoading(true);
    final result = await _bookingRepo.getBooking(id);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getBooking),
      (booking) => this.booking(booking),
    );
    isLoading(false);
  }
}
