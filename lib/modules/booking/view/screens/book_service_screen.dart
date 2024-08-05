import '../../../../core/extensions/non_null_extensions.dart';
import '../components/choose_address_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';
import '../../controller/book_service_controller.dart';
import '../components/choose_date_component.dart';
import '../components/choose_employee_component.dart';
import '../components/choose_time_component.dart';

class BookServiceScreen extends GetWidget<BookServiceController> {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MainAppbar(title: AppStrings.bookService.tr),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
          children: [
            const ChooseEmployeeComponent(),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
              child: Divider(height: AppSize.s1, thickness: AppSize.s6, color: AppColors.grey100),
            ),
            const ChooseDateComponent(),
            Obx(() {
              controller.morningTimes.value;
              controller.afternoonTimes.value;
              controller.eveningTimes.value;
              controller.nightTimes.value;
              return Column(
                key: UniqueKey(),
                children: [
                  ChooseTimeComponent(period: AppStrings.morning, times: controller.morningTimes),
                  ChooseTimeComponent(period: AppStrings.afternoon, times: controller.afternoonTimes),
                  ChooseTimeComponent(period: AppStrings.evening, times: controller.eveningTimes),
                  ChooseTimeComponent(period: AppStrings.night, times: controller.nightTimes),
                ],
              );
            }),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
              child: Divider(height: AppSize.s1, thickness: AppSize.s6, color: AppColors.grey100),
            ),
            const ChooseAddressComponent(),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
              child: Divider(height: AppSize.s1, thickness: AppSize.s6, color: AppColors.grey100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: CustomTextField(
                keyBoardType: TextInputType.multiline,
                minLines: 4,
                maxLines: 8,
                onChanged: (value) => controller.bookingBody.copyWith(hint: value),
                label: AppStrings.hint.tr,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
              child: Divider(height: AppSize.s1, thickness: AppSize.s6, color: AppColors.grey100),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: AppStrings.couponCode.tr,
                      onChanged: (value) => controller.validateCouponBody.copyWith(coupon: value),
                      prefix: const CustomIcon.svg(AppIcons.ticket),
                    ),
                  ),
                  const HorizontalSpace(AppSize.s12),
                  Obx(
                    () => CustomButton(
                      onPressed: () {
                        if (controller.validateCouponBody.coupon.orEmpty.isNotEmpty) controller.validateCoupon();
                      },
                      text: AppStrings.apply.tr,
                      isLoading: controller.isValidatingCoupon.value,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: AppPadding.p20, bottom: AppPadding.p12),
              child: Divider(height: AppSize.s1, thickness: AppSize.s6, color: AppColors.grey100),
            ),
            Obx(
              () {
                controller.isValidatingCoupon.value;
                return CustomButton(
                  key: UniqueKey(),
                  margin: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  text: "${AppStrings.bookServiceBy.tr} ${controller.bookingBody.subtotal - controller.bookingBody.getCouponValue} ${configs.value!.defaultCurrency}",
                  onPressed: controller.toBookingSummary,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
