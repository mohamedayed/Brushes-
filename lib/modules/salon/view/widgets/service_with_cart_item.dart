import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/salon/controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../e_service/models/responses/e_service_model.dart';

class ServiceWithCartItem extends GetWidget<SalonDetailsController> {
  final EService service;

  const ServiceWithCartItem({required this.service, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey100),
        borderRadius: BorderRadius.circular(6),
      ),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: AppColors.grey100),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomImage(
              image: service.images.isEmpty ? "" : service.images[0].url,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomText(
                      Utils.localizedValue(context, service.name),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      autoSized: true,
                    ),
                  ),
                  VerticalSpace(10),
                  Row(
                    children: [
                      CustomText(AppStrings.startFrom.tr, color: AppColors.grey, fontSize: 12),
                      Spacer(),
                      PriceWidget(myPrice: service.price.toDouble())
                    ],
                  ),
                  VerticalSpace(10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIcon(Icons.access_time_rounded, color: AppColors.black, size: 16),
                      HorizontalSpace(4),
                      CustomText(
                        service.duration,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        maxLines: 1,
                      ),
                      service.discountPrice == 0.0 ? SizedBox() : Spacer(),
                      service.discountPrice == 0.0
                          ? SizedBox()
                          : PriceWidget(myPrice: service.discountPrice.toDouble()),
                    ],
                  ),
                  const Spacer(),
                  StatefulBuilder(
                    builder: (context, setState) => controller.bookingBody.eServices!
                                .indexWhere((s) => s.id == service.id) ==
                            -1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CustomIcon.svg(AppIcons.success),
                                  const HorizontalSpace(AppSize.s6),
                                  CustomText(AppStrings.addedToCart.tr, color: AppColors.grey, fontSize: 10),
                                ],
                              ),
                              CustomButton(
                                text: AppStrings.remove.tr,
                                color: AppColors.white,
                                isOutlined: true,
                                onPressed: () {
                                  controller.bookingBody.eServices!.removeWhere((s) => s.id == service.id);
                                  controller.numberOfReservedServices(controller.numberOfReservedServices.value - 1);
                                  setState(() {});
                                },
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                text: AppStrings.addToCart.tr,
                                onPressed: () => Utils.invokeIfAuthenticated(
                                  callback: () {
                                    controller.bookingBody.eServices!.add(service);
                                    controller.numberOfReservedServices(controller.numberOfReservedServices.value + 1);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
