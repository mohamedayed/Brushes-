import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class CheckoutBottomWidget extends GetWidget<CheckoutController> {
  const CheckoutBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImage(
                  image:
                      controller.bookingBody.salon!.images.isEmpty ? "" : controller.bookingBody.salon!.images[0].url,
                  height: AppSize.s82,
                  width: AppSize.s82,
                  borderRadius: AppSize.s250,
                ),
                const HorizontalSpace(AppSize.s12),
                Expanded(
                  child: Wrap(
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: <Widget>[
                      CustomText(
                        Utils.localizedValue(context, controller.bookingBody.salon!.name),
                        fontWeight: FontWeightManager.bold,
                      ),
                      const Divider(height: AppSize.s8, thickness: 1),
                      PriceRow(
                        description: AppStrings.taxAmount.tr,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: PriceWidget(myPrice: controller.bookingBody.taxesValue, textSizeFactor: 1.2),
                        ),
                      ),
                      PriceRow(
                        description: AppStrings.subtotal.tr,
                        hasDivider: true,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: PriceWidget(myPrice: controller.bookingBody.subtotal, textSizeFactor: 1.2),
                        ),
                      ),
                      if ((controller.bookingBody.couponValue ?? 0) > 0)
                        PriceRow(
                          description: AppStrings.coupon.tr,
                          hasDivider: true,
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Wrap(
                              children: [
                                const CustomText(' - '),
                                PriceWidget(myPrice: controller.bookingBody.getCouponValue, textSizeFactor: 1.2),
                              ],
                            ),
                          ),
                        ),
                      PriceRow(
                        description: AppStrings.totalAmount.tr,
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: PriceWidget(myPrice: controller.bookingBody.total, textSizeFactor: 1.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => CustomButton(
              isLoading: controller.isCreatingBooking.value,
              text: AppStrings.confirmAndBookNow.tr,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              onPressed: controller.confirmAndBookNow,
            ),
          ),
        ],
      ),
    );
  }
}
