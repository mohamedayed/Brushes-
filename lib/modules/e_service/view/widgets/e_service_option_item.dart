import 'package:flutter/material.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/option_model.dart';

class EServiceOptionItem extends StatelessWidget {
  final Option option;
  final bool isSelected;
  final VoidCallback? onTap;

  const EServiceOptionItem({
    required this.option,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100, // Set a fixed width for each item
        margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s8),
          border: isSelected ? Border.all(color: AppColors.open, width: 2) : null,
          color: isSelected ? AppColors.open : AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: CustomImage(image: option.image.url, height: 70, width: 70),
            ),
            const VerticalSpace(AppSize.s4),
            CustomText(
              option.name,
              fontSize: FontSize.s12,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            PriceWidget(myPrice: option.price.toDouble()),
          ],
        ),
      ),
    );
  }
}
