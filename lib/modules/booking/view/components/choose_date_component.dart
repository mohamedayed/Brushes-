import '../../../../config/localization/l10n/l10n.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../booking/controller/book_service_controller.dart';

class ChooseDateComponent extends GetWidget<BookServiceController> {
  const ChooseDateComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      width: 60,
      height: 90,
      daysCount: 30,
      dateTextStyle: TextStyle(
          fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
          fontSize: FontSize.s20,
          fontWeight: FontWeightManager.bold),
      dayTextStyle: TextStyle(
        fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        fontSize: FontSize.s12,
      ),
      monthTextStyle: TextStyle(
        fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        fontSize: FontSize.s12,
      ),
      initialSelectedDate: DateTime.now(),
      selectionColor: AppColors.black,
      selectedTextColor: AppColors.white,
      locale: Get.locale.toString(),
      onDateChange: (date) => controller.getTimes(date: date),
    );
  }
}
