import '../../controller/booking_rating_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../../../di_container.dart';
import '../../models/responses/booking_model.dart';
import '../widgets/rating_star.dart';

class RatingDialog extends StatelessWidget {
  final bool isBooking;
  final Booking? booking;

  const RatingDialog({required this.isBooking, this.booking, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: GetBuilder<BookingRatingController>(
        init: sl<BookingRatingController>(),
        builder: (controller) {
          controller.addReviewBody.copyWith(bookingId: booking?.id);
          return Stack(
            clipBehavior: Clip.none,
            fit: StackFit.loose,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.ratingStar),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.ratingStar),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 52,
                      color: AppColors.ratingStar,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white.withOpacity(0.5),
                          ),
                          child: CustomIcon(Icons.close),
                        ),
                      ),
                    ),
                    VerticalSpace(14),
                    CustomText(AppStrings.howWasYourExperience.tr, fontWeight: FontWeightManager.bold),
                    VerticalSpace(16),
                    RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4),
                      onRatingUpdate: (value) => controller.addReviewBody.copyWith(rate: value),
                      ratingWidget: RatingWidget(
                        full: const RatingStar(color: AppColors.ratingStar),
                        empty: const RatingStar(color: AppColors.gray200),
                        half: const RatingStar(color: AppColors.gray200),
                      ),
                    ),
                    VerticalSpace(32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        label: AppStrings.writeYourReview.tr,
                        hintText: AppStrings.tellUsAboutTheSalon.tr,
                        maxLines: 5,
                        minLines: 5,
                        onChanged: (text) => controller.addReviewBody..copyWith(review: text),
                      ),
                    ),
                    VerticalSpace(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Obx(
                        () => CustomButton(
                          isLoading: controller.isLoading.value,
                          onPressed: controller.addReview,
                          text: AppStrings.send.tr,
                        ),
                      ),
                    ),
                    VerticalSpace(16),
                  ],
                ),
              ),
              isBooking
                  ? PositionedDirectional(
                      top: -46,
                      start: 0,
                      end: 0,
                      child: Center(
                        child: Container(
                          height: 92,
                          width: 92,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.ratingStar),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.ratingStar),
                          ),
                          child: CustomImage(
                            image: isBooking
                                ? booking!.salon.images.isEmpty
                                    ? ""
                                    : booking!.salon.images[0].url
                                : "",
                            height: 92,
                            width: 92,
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }
}
