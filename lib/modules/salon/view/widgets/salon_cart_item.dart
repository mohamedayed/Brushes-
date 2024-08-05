import '../../../../core/utils/utils.dart';
import '../../controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../../e_service/models/responses/e_service_model.dart';

class SalonCartItem extends GetView<SalonDetailsController> {
  final EService service;
  final VoidCallback onRemoveFromCart;

  const SalonCartItem({super.key, required this.service, required this.onRemoveFromCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: AppColors.gray200), borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomImage(image: service.images[0].url, width: 82, height: 82, borderRadius: 6),
              HorizontalSpace(4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        Utils.localizedValue(context, service.name),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                      VerticalSpace(10),
                      Row(
                        children: [
                          CustomText(AppStrings.startFrom.tr, color: AppColors.grey, fontSize: 12),
                          Spacer(),
                          PriceWidget(myPrice: service.price.toDouble()),
                        ],
                      ),
                      VerticalSpace(10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                            decoration: ShapeDecoration(shape: StadiumBorder(), color: AppColors.grey100),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomIcon(Icons.timer, color: AppColors.acceptedBooking, size: 16),
                                HorizontalSpace(4),
                                CustomText(
                                  service.duration,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          service.discountPrice == 0.0 ? SizedBox() : Spacer(),
                          service.discountPrice == 0.0
                              ? SizedBox()
                              : PriceWidget(
                                  myPrice: service.discountPrice.toDouble(),
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          VerticalSpace(22),
          CustomButton(
            text: AppStrings.deleteFromCart.tr,
            onPressed: onRemoveFromCart,
          ),
        ],
      ),
    );
  }
}
