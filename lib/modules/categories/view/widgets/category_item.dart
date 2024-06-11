import 'package:brushes/config/navigation/navigation.dart';
import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/categories/models/responses/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Color? color;
  final bool clickable;

  const CategoryItem(this.category, {this.color, this.clickable = true, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickable
          ? () => Get.toNamed(Routes.categoryServicesScreen, arguments: {"category": category, "color": color})
          : null,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p4),
              width: AppSize.s72,
              height: AppSize.s72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transparent,
                border: Border.all(color: color ?? category.color, width: AppSize.s1_5),
              ),
              child: Container(
                padding: const EdgeInsets.all(AppPadding.p8),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color?.withOpacity(0.1) ?? category.color.withOpacity(0.1),
                ),
                child: CustomImage(
                  image: category.image.url,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                  color: color ?? category.color,
                  placeHolderImage: AppImages.blank,
                ),
              ),
            ),
          ),
          if (clickable) const VerticalSpace(AppSize.s4),
          if (clickable)
            SizedBox(
              width: AppSize.s72,
              child: CustomText(
                Utils.localizedValue(context, category.name),
                fontWeight: FontWeightManager.light,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
