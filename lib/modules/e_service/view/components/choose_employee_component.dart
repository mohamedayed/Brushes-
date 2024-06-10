import 'package:brushes/modules/e_service/controller/book_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/book_e_service_employee_widget.dart';

class ChooseEmployeeComponent extends GetWidget<BookServiceController> {
  const ChooseEmployeeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: CustomText(AppStrings.chooseEmployee.tr, fontWeight: FontWeightManager.semiBold),
        ),
        const VerticalSpace(AppSize.s16),
        // SizedBox(
        //   height: 120,
        //   width: double.infinity,
        //   child: Obx(
        //     () {
        //       return controller.salon.employees.isEmpty
        //           ? CustomEmptyListSmallWidget(title: AppStrings.noWorkers.tr, image: AppImages.emptyBooking)
        //           : ListView.separated(
        //               scrollDirection: Axis.horizontal,
        //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        //               itemCount: controller.booking.value.salon.employees.length,
        //               separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s6),
        //               itemBuilder: (context, index) =>
        //                   BookEServiceEmployeeWidget(controller.booking.value.salon.employees[index]),
        //             );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
