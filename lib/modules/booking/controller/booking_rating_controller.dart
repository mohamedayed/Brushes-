import 'dart:async';

import 'package:brushes/core/extensions/non_null_extensions.dart';
import 'package:brushes/core/resources/app_strings.dart';
import 'package:brushes/core/utils/alerts.dart';
import 'package:brushes/modules/booking/models/requests/add_review_body.dart';
import 'package:brushes/modules/booking/repositories/booking_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BookingRatingController extends GetxController {
  BookingRepo _bookingRepo;

  BookingRatingController(this._bookingRepo);

  @override
  void onInit() {
    super.onInit();
    addReviewBody = AddReviewBody();
  }

  late final AddReviewBody addReviewBody;
  RxBool isLoading = false.obs;

  Future<void> addReview() async {
    if (addReviewBody.rate.orZero == 0) {
      Alerts.showToast(AppStrings.pleaseTabStars.tr);
      return;
    }
    if (addReviewBody.review.orEmpty.isEmpty) {
      Alerts.showToast(AppStrings.tellUsAboutTheSalon.tr);
      return;
    }
    isLoading(true);
    final result = await _bookingRepo.addReview(addReviewBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (review) {
        Alerts.showToast(AppStrings.reviewAdded.tr);
        Get.back();
      },
    );
    isLoading(false);
  }
}
