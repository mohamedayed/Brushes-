import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../views.dart';

class DefaultBackButton extends StatelessWidget {
  final IconData icon;
  final bool isOutlined;

  const DefaultBackButton({
    this.icon = Icons.arrow_back,
    this.isOutlined = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          border: isOutlined ? Border.all(color: AppColors.gray200) : null,
          color: isOutlined ? AppColors.white : AppColors.gray200,
          borderRadius: BorderRadius.circular(AppSize.s6),
        ),
        child: CustomIcon(icon, size: AppSize.s16, color: AppColors.black),
      ),
    );
  }
}
