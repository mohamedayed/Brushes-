import 'package:brushes/modules/salon/controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/units_utils.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';

class SalonHeader extends GetWidget<SalonDetailsController> {
  const SalonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: 175,
              child: PageView.builder(
                controller: controller.pageController,
                itemBuilder: (context, index) => CustomImage(
                  image: controller.salon.value!.images[index].url,
                  height: 175,
                  width: double.infinity,
                ),
                itemCount: controller.salon.value!.images.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.white),
              child: SmoothPageIndicator(
                controller: controller.pageController,
                effect: const WormEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.gray200,
                  dotHeight: 6,
                  dotWidth: 6,
                ),
                count: controller.salon.value!.images.length,
              ),
            )
          ],
        ),
        const VerticalSpace(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                image: controller.salon.value!.images[0].url,
                width: 60,
                height: 60,
                borderRadius: 200,
              ),
              const HorizontalSpace(4),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            Utils.localizedValue(context, controller.salon.value!.name),
                            fontWeight: FontWeightManager.semiBold,
                          ),
                        ),
                        const HorizontalSpace(4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CustomIcon.svg(AppIcons.location, size: AppSize.s12),
                            const HorizontalSpace(4),
                            CustomText(
                              UnitsUtils.getDistance(controller.salon.value!.distance.toDouble()),
                              fontSize: 10,
                              maxLines: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar(
                          initialRating: controller.salon.value!.rate.toDouble(),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemPadding: EdgeInsets.zero,
                          onRatingUpdate: (value) {},
                          itemSize: 20,
                          ratingWidget: RatingWidget(
                            full: const CustomIcon(Icons.star_rounded, size: 16, color: AppColors.ratingStar),
                            empty: const CustomIcon(Icons.star_outline_rounded, size: 16, color: AppColors.gray200),
                            half: const CustomIcon(Icons.star_half_rounded, size: 16),
                          ),
                        ),
                        const HorizontalSpace(4),
                        CustomText(
                          controller.salon.value!.rate.toStringAsFixed(2),
                          height: 0,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 72,
                          height: 32,
                          child: Stack(
                            children: List.generate(
                              controller.salon.value!.reviews.length > 3 ? 3 : controller.salon.value!.reviews.length,
                              (index) => PositionedDirectional(
                                end: (index * 16).toDouble(),
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.white, width: 2),
                                    borderRadius: BorderRadius.circular(250),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        controller.salon.value!.reviews[index].booking.user.avatar.url,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomText("+${controller.salon.value!.totalReviews}")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const VerticalSpace(20),
        if (Utils.localizedValue(context, controller.salon.value!.description).isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomText(
              Utils.localizedValue(context, controller.salon.value!.description),
              maxLines: 6,
              textAlign: TextAlign.start,
            ),
          ),
        if (Utils.localizedValue(context, controller.salon.value!.description).isNotEmpty) const VerticalSpace(20),
      ],
    );
  }
}
