import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/units_utils.dart';
import '../../../e_service/models/responses/e_service_model.dart';

class ServiceGridItem extends StatelessWidget {
  final EService service;
  final bool flexibleDimensions;

  const ServiceGridItem({required this.flexibleDimensions, required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.eServiceDetailsScreen, arguments: {'id': service.id}),
      child: Container(
        width: flexibleDimensions ? null : 175,
        height: flexibleDimensions ? null : 224,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.grey100),
        ),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.grey100),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CustomImage(
                    image: service.images.isEmpty ? "" : service.images[0].url,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  PositionedDirectional(
                    top: 6,
                    end: 6,
                    child: Container(
                      width: 36,
                      height: 36,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 1),
                      ),
                      foregroundDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 1),
                      ),
                      child: CustomImage(
                        image: service.salon.images.isEmpty ? "" : service.salon.images[0].url,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    Utils.localizedValue(context, service.name),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                  ),
                  const VerticalSpace(AppSize.s4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: FittedBox(
                          child: RatingBar(
                            initialRating: service.salon.rate.toDouble(),
                            direction: Axis.horizontal,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemPadding: EdgeInsets.zero,
                            onRatingUpdate: (value) {},
                            itemSize: 24,
                            ratingWidget: RatingWidget(
                              full: const CustomIcon(Icons.star_rounded, size: 16, color: AppColors.ratingStar),
                              empty: const CustomIcon(Icons.star_outline_rounded, size: 16, color: AppColors.gray200),
                              half: const CustomIcon(Icons.star_half_rounded, size: 16),
                            ),
                          ),
                        ),
                      ),
                      HorizontalSpace(4),
                      Expanded(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (context, constraints) => SizedBox(
                            height: constraints.maxWidth / 2.5,
                            child: Stack(
                              children: List.generate(
                                service.salon.reviews.length > 3 ? 3 : service.salon.reviews.length,
                                (index) => PositionedDirectional(
                                  end: (index * constraints.maxWidth / 4).toDouble(),
                                  child: Container(
                                    height: constraints.maxWidth / 2.5,
                                    width: constraints.maxWidth / 2.5,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.white, width: 2),
                                      borderRadius: BorderRadius.circular(250),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(service.salon.reviews[index].booking.user.avatar.url),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomText("+${service.salon!.totalReviews}")
                    ],
                  ),
                  VerticalSpace(4),
                  Row(
                    children: [
                      const CustomIcon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const HorizontalSpace(4),
                      Expanded(
                        child: CustomText(
                          UnitsUtils.getDistance(service.salon.availabilityRange.toDouble()),
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                          fontSize: 10,
                          maxLines: 1,
                          autoSized: true,
                        ),
                      ),
                      HorizontalSpace(2),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: service.salon.closed
                              ? AppColors.warning.withOpacity(0.06)
                              : AppColors.open.withOpacity(0.06),
                        ),
                        child: CustomText(
                          service.salon.closed ? AppStrings.closed.tr : AppStrings.opened.tr,
                          color: service.salon.closed ? AppColors.warning : AppColors.open,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
