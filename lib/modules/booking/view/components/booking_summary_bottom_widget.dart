import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/booking/controller/booking_summary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class BookingSummaryBottomWidget extends GetWidget<BookingSummaryController> {
  const BookingSummaryBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> paymentDetails = [
      Column(
        children: List.generate(
          controller.bookingBody.salon?.taxes.length ?? 0,
          (index) {
            final tax = controller.bookingBody.salon!.taxes[index];
            return PriceRow(
              description: tax.name,
              hasDivider: (controller.bookingBody.salon!.taxes.length - 1) == index,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: tax.type == 'percent'
                    ? CustomText('${tax.value}%')
                    : PriceWidget(
                        myPrice: tax.value.toDouble(),
                        textSizeFactor: 1.2,
                      ),
              ),
            );
          },
        ),
      ),
      PriceRow(
        description: AppStrings.taxAmount.tr,
        hasDivider: false,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PriceWidget(myPrice: controller.bookingBody.taxesValue, textSizeFactor: 1.2),
        ),
      ),
      PriceRow(
        description: AppStrings.subtotal.tr,
        hasDivider: true,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PriceWidget(myPrice: controller.bookingBody.subtotal, textSizeFactor: 1.2),
        ),
      ),
      if ((controller.bookingBody.couponValue ?? 0) > 0)
        PriceRow(
          description: AppStrings.coupon.tr,
          hasDivider: true,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Wrap(
              children: [
                const CustomText(' - '),
                PriceWidget(myPrice: controller.bookingBody.getCouponValue, textSizeFactor: 1.2),
              ],
            ),
          ),
        ),
      PriceRow(
        description: AppStrings.totalAmount.tr,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PriceWidget(myPrice: controller.bookingBody.total, textSizeFactor: 1.2),
        ),
      ),
    ];
    controller.bookingBody.eServices?.forEach((eService) {
      final options =
          controller.bookingBody.options?.where((option) => option.eServiceId == eService.id).toList() ?? [];
      paymentDetails.insert(
        0,
        Wrap(
          children: [
            PriceRow(
              description: Utils.localizedValue(context, eService.name),
              hasDivider: true,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: PriceWidget(myPrice: eService.getPrice.toDouble(), textSizeFactor: 1.2),
              ),
            ),
            Column(
              children: List.generate(
                options.length,
                (index) => PriceRow(
                  description: options[index].name,
                  hasDivider: (options.length - 1) == index,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: PriceWidget(myPrice: options[index].price.toDouble(), textSizeFactor: 1.2),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p10),
            child: Column(children: paymentDetails),
          ),
          CustomButton(
            text: AppStrings.confirmAndBookNow.tr,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            onPressed: () async {
              // Get.toNamed(Routes.CHECKOUT, arguments: _booking);
            },
          ),
        ],
      ),
    );
  }
}
