import 'package:brushes/core/resources/app_values.dart';
import 'package:brushes/core/services/address/address_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AddressWidget extends StatelessWidget {
  final bool hasMargin;

  const AddressWidget({super.key, this.hasMargin = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.addressesScreen),
      child: Container(
        margin: hasMargin ? const EdgeInsets.symmetric(vertical: 0, horizontal: AppPadding.p8) : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.gray250), borderRadius: BorderRadius.circular(6.0)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(6.0)),
              child: const CustomIcon.svg(AppIcons.location, color: AppColors.address, size: 18),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(AppStrings.yourLocation.tr, fontSize: 12),
                  VerticalSpace(2),
                  Obx(
                    () {
                      if (AddressService.currentAddress.value == null) {
                        return CustomText(AppStrings.addressNotAvailable.tr, maxLines: 1, fontSize: FontSize.s12);
                      }
                      return CustomText(
                        AddressService.currentAddress.value!.address,
                        maxLines: 1,
                        color: AppColors.address,
                        fontSize: FontSize.s12,
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            CustomIcon(Icons.arrow_forward_ios, size: 16, color: AppColors.address)
          ],
        ),
      ),
    );
  }
}
