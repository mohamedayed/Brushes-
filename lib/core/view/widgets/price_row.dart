import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  final String description;
  final String? value;
  final int? descriptionFlex;
  final int? valueFlex;
  final Widget? child;
  final bool? hasDivider;

  const PriceRow({
    super.key,
    required this.description,
    this.value,
    this.hasDivider,
    this.child,
    this.descriptionFlex,
    this.valueFlex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: descriptionFlex ?? 1,
              child: CustomText(description, color: AppColors.black, fontSize: FontSize.s12),
            ),
            Expanded(
              flex: valueFlex ?? 1,
              child: child ??
                  CustomText(
                    value ?? "",
                    color: AppColors.primary,
                    maxLines: 3,
                    textAlign: TextAlign.end,
                  ),
            ),
          ],
        ),
        if (hasDivider != null && hasDivider!) const Divider(thickness: 1, height: 25),
        if (hasDivider != null && !hasDivider!) const SizedBox(height: 6),
      ],
    );
  }
}
