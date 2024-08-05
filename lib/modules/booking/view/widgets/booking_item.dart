import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';
import '../../models/requests/booking_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart' show DateFormat;

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../models/responses/booking_model.dart';

class BookingItem extends StatelessWidget {
  final Booking booking;
  final bool inList;

  const BookingItem({required this.booking, required this.inList, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: inList ? () => Get.toNamed(Routes.bookingDetailsScreen, arguments: {"id": booking.id}) : null,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        clipBehavior: inList ? Clip.antiAlias : Clip.none,
        decoration: inList
            ? BoxDecoration(border: Border.all(color: AppColors.gray200), borderRadius: BorderRadius.circular(6))
            : null,
        foregroundDecoration: inList
            ? BoxDecoration(border: Border.all(color: AppColors.gray200), borderRadius: BorderRadius.circular(6))
            : null,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: booking.status.color.withOpacity(0.2),
              width: double.infinity,
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.white),
                        ),
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.white),
                        ),
                        child: CustomImage(
                          image: booking.salon.images.isEmpty ? "" : booking.salon.images[0].url,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      const HorizontalSpace(AppSize.s10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomText("#${booking.id}", fontWeight: FontWeight.w300, fontSize: 12),
                            const VerticalSpace(AppSize.s4),
                            CustomText(
                              booking.employee != null
                                  ? booking.employee!.name
                                  : Utils.localizedValue(context, booking.salon.name),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              autoSized: true,
                              maxLines: 1,
                            ),
                            const VerticalSpace(AppSize.s4),
                            PriceWidget(
                              myPrice: BookingBody(
                                couponValue: booking.coupon.value.toDouble(),
                                salon: booking.salon,
                                options: booking.options,
                                eServices: booking.eServices,
                              ).total,
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpace(6),
                      Column(
                        children: [
                          Container(
                            width: 62,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColors.black),
                            ),
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColors.black),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: AppColors.black),
                                  child: CustomText(
                                    DateFormat('E', Get.locale.toString()).format(booking.bookingAt),
                                    color: AppColors.white,
                                    maxLines: 1,
                                    autoSized: true,
                                  ),
                                ),
                                VerticalSpace(4),
                                CustomText(
                                  DateFormat('dd', Get.locale.toString()).format(booking.bookingAt),
                                  autoSized: true,
                                  fontWeight: FontWeight.w600,
                                ),
                                CustomText(DateFormat('MMM', Get.locale.toString()).format(booking.bookingAt)),
                                VerticalSpace(4),
                                CustomText(DateFormat('yyyy', Get.locale.toString()).format(booking.bookingAt)),
                              ],
                            ),
                          ),
                          VerticalSpace(4),
                          CustomText(
                            "${DateFormat('HH:mm', Get.locale.toString()).format(booking.bookingAt)}",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const VerticalSpace(8),
                  Container(
                    padding: const EdgeInsets.all(AppPadding.p4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.gray200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.grey100,
                          ),
                          child: SvgPicture.asset(AppIcons.location, width: 16, height: 16),
                        ),
                        HorizontalSpace(6),
                        Expanded(
                          child: CustomText(
                            booking.address.address,
                            fontSize: 12,
                            maxLines: 1,
                            autoSized: true,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
