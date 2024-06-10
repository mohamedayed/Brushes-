import 'package:brushes/core/utils/alerts.dart';
import 'package:brushes/modules/e_service/repositories/book_e_service_repo.dart';
import 'package:brushes/modules/profile/models/responses/user_model.dart';
import 'package:brushes/modules/salon/models/responses/salon_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../repositories/e_service_repo.dart';

class BookServiceController extends GetxController {
  final BookEServiceRepo _bookEServiceRepo;

  BookServiceController(this._bookEServiceRepo);

  late final Salon salon;
  late final UserModel? employee;
  RxBool isLoadingTimes = false.obs;
  RxString selectedTime = "".obs;

  // final booking = Booking().obs;
  final atSalon = true.obs;
  final isLoadingAddress = false.obs;

  // final addresses = <Address>[].obs;
  RxList<List<dynamic>> morningTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> afternoonTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> eveningTimes = <List<dynamic>>[].obs;
  RxList<List<dynamic>> nightTimes = <List<dynamic>>[].obs;

  // DatePickerController datePickerController = DatePickerController();

  // Address get currentAddress => Get.find<SettingsService>().address.value;

  // @override
  // void onInit() async {
  //   final _booking = (Get.arguments['booking'] as Booking);
  //   print("object=> init${_booking}");
  //   this.booking.value = Booking(
  //     eServices: _booking.eServices,
  //     salon: _booking.salon,
  //     taxes: _booking.salon.taxes,
  //     options: _booking.options,
  //     quantity: _booking.quantity,
  //     user: Get.find<AuthService>().user.value,
  //     coupon: new Coupon(),
  //   );
  //   await getAddresses();
  //   await getTimes();
  //   super.onInit();
  // }

  Future<void> getTimes({DateTime? date}) async {
    nightTimes.clear();
    morningTimes.clear();
    afternoonTimes.clear();
    eveningTimes.clear();
    isLoadingTimes(true);
    final result = await _bookEServiceRepo.getAvailabilityHours(
      salon.id,
      date ?? DateTime.now(),
      employeeId: employee?.id,
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

  void toggleAtSalon(value) {
    atSalon.value = value;
  }

// void validateCoupon() async {
//   try {
//     FocusManager.instance.primaryFocus?.unfocus();
//     Coupon _coupon = await _bookingRepository.coupon(booking.value);
//     booking.update((val) {
//       val.coupon = _coupon;
//     });
//     if (_coupon.hasData) {
//       Get.showSnackbar(Ui.SuccessSnackBar(message: "Coupon code is applied".tr, snackPosition: SnackPosition.TOP));
//     } else {
//       Get.showSnackbar(Ui.ErrorSnackBar(message: "Invalid Coupon Code".tr, snackPosition: SnackPosition.TOP));
//     }
//   } catch (e) {
//     Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
//   }
// }

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
