import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/categories/models/responses/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/view/views.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Color? color;

  const CategoryItem(this.category, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const VerticalSpace(AppSize.s4),
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
    );
  }
}
