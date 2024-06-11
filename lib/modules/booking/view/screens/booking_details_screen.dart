import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/services/outsource_services.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/booking/controller/booking_details_controller.dart';
import 'package:brushes/modules/booking/models/requests/booking_body.dart';
import 'package:brushes/modules/booking/view/components/booking_summary_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/booking_detail_row.dart';
import '../widgets/booking_item.dart';

class BookingDetailsScreen extends GetWidget<BookingDetailsController> {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.bookingDetails.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingSpinner()
            : controller.booking.value == null
                ? const SizedBox.shrink()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BookingItem(booking: controller.booking.value!, inList: false),
                          const VerticalSpace(AppSize.s14),
                          const Divider(color: AppColors.grey100, height: 1, thickness: 5),
                          ListTile(
                            title: CustomText(AppStrings.contactProvider.tr, fontWeight: FontWeight.w300),
                            subtitle: CustomText(
                              controller.booking.value!.salon.phoneNumber ?? '',
                              fontWeight: FontWeight.w400,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                OutlinedIconButton(
                                  icon: AppIcons.call,
                                  color: AppColors.gray300,
                                  iconColor: AppColors.black,
                                  onTap: () =>
                                      OutsourceServices.launch("tel:${controller.booking.value!.salon.phoneNumber}"),
                                ),
                                const HorizontalSpace(AppSize.s12),
                                OutlinedIconButton(
                                  icon: AppIcons.message,
                                  color: AppColors.gray300,
                                  iconColor: AppColors.black,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: AppPadding.p4, bottom: AppPadding.p20),
                            child: Divider(color: AppColors.grey100, height: 1, thickness: 5),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(AppStrings.bookingDetails.tr, fontWeight: FontWeight.bold),
                                CustomText("#${controller.booking.value!.id}"),
                              ],
                            ),
                          ),
                          BookingDetailRow(
                            title: AppStrings.status.tr,
                            value: controller.booking.value!.status.status.tr,
                          ),
                          const Divider(height: 1),
                          BookingDetailRow(
                            title: AppStrings.paymentStatus.tr,
                            value: controller.booking.value!.payment.paymentStatus.status.isEmpty
                                ? AppStrings.notPaid.tr
                                : controller.booking.value!.payment.paymentStatus.status,
                          ),
                          const Divider(height: 1),
                          BookingDetailRow(
                            title: AppStrings.paymentMethod.tr,
                            value: Utils.localizedValue(context, controller.booking.value!.payment.paymentMethod.name),
                          ),
                          if (controller.booking.value!.hint.isNotEmpty)
                            const Divider(color: AppColors.grey100, height: 1, thickness: 5),
                          if (controller.booking.value!.hint.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: CustomText(AppStrings.hint.tr, fontWeight: FontWeight.bold),
                            ),
                          if (controller.booking.value!.hint.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(16).copyWith(top: 0),
                              child: CustomText(controller.booking.value!.hint),
                            ),
                          const Padding(
                            padding: EdgeInsets.only(top: AppPadding.p12, bottom: AppPadding.p20),
                            child: Divider(color: AppColors.grey100, height: 1, thickness: 5),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomText(AppStrings.pricing.tr, fontWeight: FontWeight.bold),
                          ),
                          BookingSummaryBottomWidget(
                            informative: true,
                            bookingBody: BookingBody(
                              eServices: controller.booking.value!.eServices,
                              options: controller.booking.value!.options,
                              salon: controller.booking.value!.salon,
                              couponValue: controller.booking.value!.coupon.value.toDouble(),
                              quantity: controller.booking.value!.quantity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: CustomButton(
                              text: AppStrings.leaveComment.tr,
                              // color: AppColors.black,
                              onPressed: () {},
                              // onPressed: () => showDialog(
                              //   context: context,
                              //   builder: (context) => RatingDialog(isBooking: true, booking: controller.booking.value),
                              // ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
