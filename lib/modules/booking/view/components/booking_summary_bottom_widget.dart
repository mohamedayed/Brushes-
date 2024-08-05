import '../../../../core/resources/resources.dart';
import '../../../../core/utils/utils.dart';
import '../../models/requests/booking_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/view/views.dart';

class BookingSummaryBottomWidget extends StatelessWidget {
  final BookingBody bookingBody;
  final bool informative;

  const BookingSummaryBottomWidget({required this.bookingBody, this.informative = false, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> paymentDetails = [
      Column(
        children: List.generate(
          bookingBody.salon?.taxes.length ?? 0,
          (index) {
            final tax = bookingBody.salon!.taxes[index];
            return PriceRow(
              description: tax.name,
              hasDivider: (bookingBody.salon!.taxes.length - 1) == index,
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
          child: PriceWidget(myPrice: bookingBody.taxesValue, textSizeFactor: 1.2),
        ),
      ),
      PriceRow(
        description: AppStrings.subtotal.tr,
        hasDivider: true,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PriceWidget(myPrice: bookingBody.subtotal, textSizeFactor: 1.2),
        ),
      ),
      if ((bookingBody.couponValue ?? 0) > 0)
        PriceRow(
          description: AppStrings.coupon.tr,
          hasDivider: true,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Wrap(
              children: [
                const CustomText(' - '),
                PriceWidget(myPrice: bookingBody.getCouponValue, textSizeFactor: 1.2),
              ],
            ),
          ),
        ),
      PriceRow(
        description: AppStrings.totalAmount.tr,
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PriceWidget(myPrice: bookingBody.total, textSizeFactor: 1.2),
        ),
      ),
    ];
    bookingBody.eServices?.forEach((eService) {
      final options = bookingBody.options?.where((option) => option.eServiceId == eService.id).toList() ?? [];
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
          if (!informative)
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
          if (!informative)
            CustomButton(
              text: AppStrings.confirmAndBookNow.tr,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              onPressed: () => Get.toNamed(Routes.checkoutScreen, arguments: {"booking_body": bookingBody}),
            ),
        ],
      ),
    );
  }
}
