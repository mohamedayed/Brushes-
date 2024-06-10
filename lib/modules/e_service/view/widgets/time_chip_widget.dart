import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/book_service_controller.dart';

class TimeChipWidget extends GetWidget<BookServiceController> {
  final bool _isAvailable;
  final String time;

  const TimeChipWidget({required this.time, super.key}) : _isAvailable = true;

  const TimeChipWidget.notAvailable({required this.time, super.key}) : _isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => controller.selectedTime(time),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
          decoration: BoxDecoration(
            color: _isAvailable
                ? controller.selectedTime.value == time
                    ? AppColors.black
                    : AppColors.white
                : AppColors.grey100,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: AppColors.primary),
          ),
          child: Center(
            child: CustomText(
              DateFormat('HH:mm').format(DateTime.parse(time).toLocal()),
              color: _isAvailable
                  ? controller.selectedTime.value == time
                      ? AppColors.white
                      : AppColors.black
                  : AppColors.grey,
            ),
          ),
          //   color:Colors.yellow,
        ),
      );
    });
  }
}
