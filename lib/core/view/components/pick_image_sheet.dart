import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../utils/pickers.dart';
import '../views.dart';

class PickImageSheet extends BasePlatformWidget<Column, CupertinoActionSheet> {
  final void Function(File? image) onPickImage;
  final void Function(List<File> images)? onPickMultipleImages;

  const PickImageSheet({required this.onPickImage, this.onPickMultipleImages, super.key});

  @override
  CupertinoActionSheet createCupertinoWidget(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        if (onPickMultipleImages != null)
          CupertinoActionSheetAction(
            child: CustomText(AppStrings.moreThanOneImage.tr),
            onPressed: () async {
              final List<File> images = await Pickers.pickMultiImages(context);
              Get.back();
              onPickMultipleImages!(images);
            },
          ),
        CupertinoActionSheetAction(
          child: CustomText(AppStrings.gallery.tr, fontWeight: FontWeightManager.semiBold),
          onPressed: () async {
            final File? image = await Pickers.pickImage(context);
            Get.back();
            onPickImage(image);
          },
        ),
        CupertinoActionSheetAction(
          child: CustomText(AppStrings.camera.tr, fontWeight: FontWeightManager.semiBold),
          onPressed: () async {
            final File? image = await Pickers.pickImage(context, fromGallery: false);
            Get.back();
            onPickImage(image);
          },
        ),
        CupertinoActionSheetAction(
          child: CustomText(
            AppStrings.cancel.tr,
            fontWeight: FontWeightManager.semiBold,
            color: AppColors.warning,
          ),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }

  @override
  Column createMaterialWidget(BuildContext context) {
    return Column(
      children: [
        if (onPickMultipleImages != null)
          CustomButton(
            isOutlined: true,
            onPressed: () async {
              final List<File> images = await Pickers.pickMultiImages(context);
              Get.back();
              onPickMultipleImages!(images);
            },
            child: Row(
              children: [
                const CustomIcon(Icons.image, color: AppColors.grey),
                const HorizontalSpace(AppSize.s8),
                CustomText(AppStrings.moreThanOneImage.tr)
              ],
            ),
          ),
        if (onPickMultipleImages != null) const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          isOutlined: true,
          // color: AppColors.black,
          onPressed: () async {
            final File? image = await Pickers.pickImage(context);
            Get.back();
            onPickImage(image);
          },
          child: Row(
            children: [
              const CustomIcon(Icons.image, color: AppColors.primary),
              const HorizontalSpace(AppSize.s8),
              CustomText(AppStrings.gallery.tr, fontWeight: FontWeightManager.semiBold)
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          isOutlined: true,
          onPressed: () async {
            final File? image = await Pickers.pickImage(context, fromGallery: false);
            Get.back();
            onPickImage(image);
          },
          child: Row(
            children: [
              const CustomIcon(Icons.camera, color: AppColors.primary),
              const HorizontalSpace(AppSize.s8),
              CustomText(AppStrings.camera.tr, fontWeight: FontWeightManager.semiBold)
            ],
          ),
        ),
        const VerticalSpace(AppSize.s12),
        CustomButton(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p8),
          onPressed: () => Get.back(),
          color: AppColors.warning,
          child: Row(
            children: [
              const CustomIcon(Icons.cancel, color: AppColors.white),
              const HorizontalSpace(AppSize.s8),
              CustomText(AppStrings.cancel.tr, color: AppColors.white)
            ],
          ),
        ),
      ],
    );
  }
}
