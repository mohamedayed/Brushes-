import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../controller/book_service_controller.dart';

class ChooseDateComponent extends GetWidget<BookServiceController> {
  const ChooseDateComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: DatePicker(
              DateTime.now(),
              width: 60,
              height: 90,
              daysCount: 30,
              // controller: controller.datePickerController,
              initialSelectedDate: DateTime.now(),
              selectionColor: Get.theme.colorScheme.primary,
              selectedTextColor: Get.theme.primaryColor,
              locale: Get.locale.toString(),
              onDateChange: (date) => controller.getTimes(date: date),
            ),
          ),
        ],
      ),
    );
  }
}
