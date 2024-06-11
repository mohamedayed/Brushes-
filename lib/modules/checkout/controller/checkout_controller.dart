import 'package:brushes/config/navigation/routes.dart';
import 'package:brushes/core/resources/resources.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../../booking/models/requests/booking_body.dart';
import '../../booking/models/responses/payment_method_model.dart';
import '../../booking/repositories/booking_repo.dart';
import '../repositories/checkout_repo.dart';

class CheckoutController extends GetxController {
  final CheckoutRepo _checkoutRepo;
  final BookingRepo _bookingRepo;

  CheckoutController(this._checkoutRepo, this._bookingRepo);

  late final BookingBody bookingBody;
  RxBool isLoading = true.obs;
  RxBool isCreatingBooking = false.obs;
  RxList<PaymentMethod> paymentMethods = <PaymentMethod>[].obs;
  Rx<PaymentMethod?> selectedPaymentMethod = Rx(null);

  @override
  void onInit() {
    super.onInit();
    bookingBody = Get.arguments["booking_body"];
    getPaymentMethods();
  }

  Future<void> getPaymentMethods() async {
    isLoading(true);
    final result = await _checkoutRepo.getPaymentMethods();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getPaymentMethods),
      (paymentMethods) => this.paymentMethods(paymentMethods),
    );
    isLoading(false);
  }

  Future<void> createBooking() async {
    isCreatingBooking(true);
    final result = await _bookingRepo.createBooking(bookingBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: createBooking),
      (paymentMethods) {
        Alerts.showToast(AppStrings.bookingBookedSuccessfully.tr);
        Get.until((route) => route.settings.name == Routes.layoutScreen);
      },
    );
    isCreatingBooking(false);
  }

  Future<void> confirmAndBookNow() async {
    if (selectedPaymentMethod.value == null) {
      Alerts.showToast(AppStrings.pleaseSelectPaymentMethod.tr);
      return;
    }

    if (selectedPaymentMethod.value!.route == "/Cash") createBooking();
  }
}
