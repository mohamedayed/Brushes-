import '../../controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';

class ReservedItemsBottomWidget extends GetWidget<SalonDetailsController> {
  const ReservedItemsBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(0, -4),
            blurRadius: 18,
          )
        ],
      ),
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  AppStrings.salonCart.tr,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                const VerticalSpace(4),
                Obx(
                  () => CustomText(
                    "${controller.selectedServices.length} ${AppStrings.elementAdded.tr}",
                    fontSize: 12,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            text: AppStrings.reserveItems.tr,
            onPressed: () => Utils.invokeIfAuthenticated(callback: () {
              controller.bookingBody.copyWith(eServices: controller.selectedServices);
              Get.toNamed(Routes.salonCartScreen);
            }),
          ),
        ],
      ),
    );
  }
}
