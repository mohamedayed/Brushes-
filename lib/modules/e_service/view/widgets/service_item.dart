import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../models/responses/e_service_model.dart';

class ServiceItem extends StatelessWidget {
  final EService service;
  final bool flexibleDimensions;

  const ServiceItem({required this.flexibleDimensions, required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.eServiceDetailsScreen, arguments: {'id': service.id}),
      child: Container(
        width: flexibleDimensions ? null : 175,
        height: flexibleDimensions ? null : 224,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.gray200),
        ),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.gray200),
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
                        image: (service.salon?.images ?? []).isEmpty ? "" : service.salon!.images[0].url,
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
                  VerticalSpace(4),
                  Row(
                    children: [
                      CustomIcon(Icons.access_time, size: 16),
                      HorizontalSpace(4),
                      Expanded(
                        child: CustomText(
                          service.duration,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s12,
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(4),
                  Row(
                    children: [
                      CustomText(AppStrings.startFrom.tr, color: AppColors.grey, fontSize: 12),
                      const Spacer(),
                      PriceWidget(myPrice: service.price.toDouble()),
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
