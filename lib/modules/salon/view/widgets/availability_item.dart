import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AvailabilityItem extends StatelessWidget {
  final MapEntry<String, List<String>> availabilityHour;
  final List<String> data;

  const AvailabilityItem({required this.availabilityHour, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 125,
      clipBehavior: Clip.antiAlias,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primary),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primary,
            width: double.infinity,
            padding: EdgeInsets.all(4),
            child: CustomText(availabilityHour.key.tr, fontSize: 10, color: AppColors.white),
          ),
          VerticalSpace(8),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Center(child: CustomText(availabilityHour.value[0], fontSize: 10, autoSized: true)),
          ),
        ],
      ),
    );
  }
}
