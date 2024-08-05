import '../../../core/utils/alerts.dart';
import '../models/responses/booking_model.dart';
import '../models/responses/booking_status.dart';
import '../repositories/booking_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/services/error/failure.dart';

class MyBookingsController extends GetxController {
  final BookingRepo _bookingRepo;

  MyBookingsController(this._bookingRepo);

  @override
  void onInit() {
    super.onInit();
    getBookingStatuses();
  }

  RxList<BookingStatus> bookingStatuses = <BookingStatus>[].obs;
  RxList<Booking> bookings = <Booking>[].obs;
  Rx<BookingStatus?> selectedBookingStatus = Rx<BookingStatus?>(null);

  Future<void> getBookingStatuses() async {
    final result = await _bookingRepo.getBookingStatuses();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getBookingStatuses),
      (bookingStatuses) {
        final statuses = bookingStatuses
            .where((status) => status.id == 1 || status.id == 3 || status.id == 6 || status.id == 7)
            .toList();
        selectedBookingStatus(statuses[0]);
        this.bookingStatuses(statuses);
      },
    );
  }

  Future<Either<Failure, PaginationModel<Booking>>> getBookings({int page = 1}) async {
    final result = await _bookingRepo.getBookings(selectedBookingStatus.value!.id, page: page);
    return result;
  }
}
