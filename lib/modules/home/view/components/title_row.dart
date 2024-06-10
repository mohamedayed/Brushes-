import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final VoidCallback? onActionPressed;
  final Widget? prefix;
  final Color? textColor;
  final Color? viewMoreColor;

  const TitleRow({
    required this.title,
    this.onActionPressed,
    this.prefix,
    this.textColor,
    this.viewMoreColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (prefix != null) prefix!,
          if (prefix != null) const HorizontalSpace(AppSize.s6),
          CustomText(title, fontWeight: FontWeightManager.medium, fontSize: FontSize.s16, color: textColor),
          const Spacer(),
          if (onActionPressed != null)
            InkWell(
              onTap: onActionPressed,
              child: CustomText(AppStrings.viewMore.tr, color: viewMoreColor, fontSize: FontSize.s12),
            )
        ],
      ),
    );
  }
}
