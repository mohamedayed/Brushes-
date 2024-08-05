import '../../controller/book_service_controller.dart';
import 'times_loading_component.dart';
import '../widgets/time_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class ChooseTimeComponent extends GetWidget<BookServiceController> {
  final String period;
  final List<List<dynamic>> times;

  const ChooseTimeComponent({required this.period, required this.times, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(AppSize.s10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: CustomText(period.tr, fontWeight: FontWeightManager.bold),
        ),
        const VerticalSpace(AppSize.s8),
        controller.isLoadingTimes.value
            ? const TimesLoadingComponent()
            : times.isEmpty
                ? CustomEmptyListSmallWidget(image: AppImages.emptyBooking, title: AppStrings.noTimes.tr)
                : SizedBox(
                    height: AppSize.s32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
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
    );
  }
}
