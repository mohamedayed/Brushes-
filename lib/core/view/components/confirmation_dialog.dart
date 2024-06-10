import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../views.dart';

class ConfirmationDialog extends BasePlatformWidget<Dialog, CupertinoAlertDialog> {
  final String title;
  final String? confirmationText;
  final String? cancellationText;
  final VoidCallback onYes;

  const ConfirmationDialog({
    required this.title,
    required this.onYes,
    this.confirmationText,
    this.cancellationText,
    super.key,
  });

  @override
  CupertinoAlertDialog createCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: CustomText(title),
      actions: [
        CupertinoDialogAction(
          child: CustomText(cancellationText ?? AppStrings.no.tr, color: AppColors.warning),
          onPressed: () => Get.back(),
        ),
        CupertinoDialogAction(
          child: CustomText(confirmationText ?? AppStrings.yes.tr),
          onPressed: () {
            Get.back();
            onYes();
          },
        ),
      ],
    );
  }

  @override
  Dialog createMaterialWidget(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.all(AppPadding.p16), child: CustomText(title)),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: cancellationText ?? AppStrings.no.tr,
                  onPressed: () => Get.back(),
                  borderRadius: AppSize.s0,
                ),
              ),
              Expanded(
                child: CustomButton(
                  text: confirmationText ?? AppStrings.yes.tr,
                  onPressed: () {
                    Get.back();
                    onYes();
                  },
                  borderRadius: AppSize.s0,
                  color: AppColors.warning,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
