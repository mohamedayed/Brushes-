import 'package:brushes/modules/e_service/controller/book_service_controller.dart';
import 'package:brushes/modules/e_service/view/widgets/time_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class ChooseTimeComponent extends GetWidget<BookServiceController> {
  final String period;

  const ChooseTimeComponent({required this.period, super.key});

  @override
  Widget build(BuildContext context) {
    RxList<List<dynamic>> times;

    switch (period) {
      case AppStrings.morning:
        times = controller.morningTimes;
        break;
      case AppStrings.afternoon:
        times = controller.afternoonTimes;
        break;
      case AppStrings.evening:
        times = controller.eveningTimes;
        break;
      case AppStrings.night:
        times = controller.nightTimes;
        break;
      default:
        times = <List<dynamic>>[].obs;
    }

    if (times.isEmpty) {
      return CustomEmptyListSmallWidget(image: AppImages.emptyBooking, title: AppStrings.noTimes.tr);
    }

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(period.tr, fontWeight: FontWeightManager.bold),
          const VerticalSpace(AppSize.s10),
          Container(
            alignment: AlignmentDirectional.centerStart,
            height: AppSize.s40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final String time = times[index][0];
                final bool available = times[index][1];
                return available ? TimeChipWidget(time: time) : TimeChipWidget.notAvailable(time: time);
              },
              separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
              itemCount: times.length,
            ),
          ),
        ],
      ),
    );
  }
}
