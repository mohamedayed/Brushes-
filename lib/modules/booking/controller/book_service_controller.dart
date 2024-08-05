import '../../../core/resources/resources.dart';
import '../../../core/utils/alerts.dart';
import '../models/requests/booking_body.dart';
import '../models/requests/validate_coupon_body.dart';
import '../repositories/book_e_service_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/navigation/navigation.dart';

class BookServiceController extends GetxController {
  final BookEServiceRepo _bookEServiceRepo;

  BookServiceController(this._bookEServiceRepo);

  @override
  void onInit() {
    super.onInit();
    bookingBody = Get.arguments["booking_body"];
    validateCouponBody = ValidateCouponBody(eServices: bookingBody.eServices, salonId: bookingBody.salon?.id);
    getTimes();
  }

  late final BookingBody bookingBody;
  late final ValidateCouponBody validateCouponBody;
  RxBool isLoadingTimes = false.obs;
  RxString selectedTime = "".obs;
  RxBool isValidatingCoupon = false.obs;
  Rx<bool?> atSalon = Rx<bool?>(null);
  RxList<List<dynamic>> morningTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> afternoonTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> eveningTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> nightTimes = <List<dynamic>>[].obs;

  Future<void> getTimes({DateTime? date}) async {
    nightTimes.clear();
    morningTimes.clear();
    afternoonTimes.clear();
    eveningTimes.clear();
    isLoadingTimes(true);
    final result = await _bookEServiceRepo.getAvailabilityHours(
      bookingBody.salon!.id,
      date ?? DateTime.now(),
      employeeId: bookingBody.employee?.id,
    );
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => getTimes(date: date)),
      (times) {
        times.sort((e1, e2) {
          final localDateTime1 = DateTime.parse(e1.elementAt(0)).toLocal();
          final hours1 = int.tryParse(DateFormat('HH').format(localDateTime1));
          final localDateTime2 = DateTime.parse(e2.elementAt(0)).toLocal();
          final hours2 = int.tryParse(DateFormat('HH').format(localDateTime2));
          return hours1!.compareTo(hours2!);
        });
        nightTimes.assignAll(times.sublist(0, 14));
        morningTimes.assignAll(times.sublist(14, 24));
        afternoonTimes.assignAll(times.sublist(24, 36));
        eveningTimes.assignAll(times.sublist(36));
      },
    );
    isLoadingTimes(false);
  }

  Future<void> validateCoupon() async {
    isValidatingCoupon(true);
    FocusManager.instance.primaryFocus?.unfocus();
    final result = await _bookEServiceRepo.validateCoupon(validateCouponBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (coupon) {
        coupon == null
            ? Alerts.showSnackBar(message: AppStrings.invalidCoupon.tr)
            : bookingBody.copyWith(couponCode: coupon.code, couponValue: coupon.value.toDouble());
      },
    );
    isValidatingCoupon(false);
  }

  void toggleSelectedTime(String value) {
    selectedTime(value);
    bookingBody.copyWith(bookingTime: selectedTime.value);
  }

  void toBookingSummary() {
    // Validations
    if (isValidatingCoupon.value) return;
    if (bookingBody.employee == null && bookingBody.salon!.employees.isNotEmpty) {
      Alerts.showToast(AppStrings.pleaseSelectAnEmployee.tr);
      return;
    }
    if (bookingBody.bookingTime == null) {
      Alerts.showToast(AppStrings.pleaseSelectYourBookingTime.tr);
      return;
    }
    if (atSalon.value == null) {
      Alerts.showToast(AppStrings.pleaseSelectBookingLocation.tr);
      return;
    }
    if (!atSalon.value! && bookingBody.address == null) {
      Alerts.showToast(AppStrings.pleaseSelectBookingAddress.tr);
      return;
    }
    Get.toNamed(Routes.bookingSummaryScreen, arguments: {"booking_body": bookingBody});
  }

// void selectEmployee(User employee) async {
//   booking.update((val) {
//     if (val.employee == null) {
//       val.employee = employee;
//     } else {
//       val.employee = null;
//     }
//   });
//   if (booking.value.bookingAt != null) {
//     await getTimes(date: booking.value.bookingAt);
//   }
// }
//
// bool isCheckedEmployee(User user) {
//   return (booking.value.employee?.id ?? '0') == user.id;
// }
}
