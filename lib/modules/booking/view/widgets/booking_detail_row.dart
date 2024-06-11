import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class BookingDetailRow extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? valueAsWidget;
  final Color? bgColor;
  final bool highlightedValue;

  const BookingDetailRow({
    super.key,
    this.highlightedValue = false,
    required this.title,
    this.value,
    this.bgColor,
    this.valueAsWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(title, fontWeight: FontWeight.bold, fontSize: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            alignment: AlignmentDirectional.center,
            constraints: const BoxConstraints(minWidth: 125),
            decoration: BoxDecoration(
              color: highlightedValue ? AppColors.primary : AppColors.grey100,
              borderRadius: BorderRadius.circular(4),
            ),
            child: valueAsWidget ??
                CustomText(
                  value ?? "",
                  color: highlightedValue ? AppColors.white : AppColors.black,
                  height: 1.5,
                ),
          )
        ],
      ),
    );
  }
}
