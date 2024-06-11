import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';

class BookingSummaryContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const BookingSummaryContainer({required this.title, required this.icon, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p8),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20, horizontal: AppPadding.p20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(title, fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s12),
          const VerticalSpace(AppSize.s8),
          Row(
            children: [
              CustomIcon(icon, color: AppColors.grey),
              const HorizontalSpace(AppSize.s12),
              Expanded(child: child),
            ],
          ),
        ],
      ),
    );
  }
}
