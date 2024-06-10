import 'package:brushes/modules/e_service/view/components/choose_date_component.dart';
import 'package:brushes/modules/e_service/view/components/choose_employee_component.dart';
import 'package:brushes/modules/e_service/view/components/choose_time_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../controller/book_service_controller.dart';

class BookServiceScreen extends GetWidget<BookServiceController> {
  const BookServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MainAppbar(title: AppStrings.bookService.tr),
      // bottomSheet: const BookingSummaryButton(),
      body: ListView(
        children: const [
          VerticalSpace(AppSize.s8),
          ChooseEmployeeComponent(),
          VerticalSpace(AppSize.s16),
          Divider(height: 1, thickness: 5, color: AppColors.grey100),
          ChooseDateComponent(),
          ChooseTimeComponent(period: AppStrings.morning),
          ChooseTimeComponent(period: AppStrings.afternoon),
          ChooseTimeComponent(period: AppStrings.evening),
          ChooseTimeComponent(period: AppStrings.night),
          VerticalSpace(AppSize.s10),
          Divider(height: 1, thickness: 5, color: AppColors.grey100),
          // BookingLocationSection(),
          VerticalSpace(AppSize.s10),
          Divider(height: 1, thickness: 5, color: AppColors.grey100),
          // HintSection(),
          VerticalSpace(AppSize.s10),
          Divider(height: 1, thickness: 5, color: AppColors.grey100),
          // CouponSection(),
          VerticalSpace(AppSize.s20),
        ],
      ),
    );
  }
}
//
// class BookingLocationSection extends StatelessWidget {
//   const BookingLocationSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     return Column(
//       children: [
//         Obx(() {
//           if (!controller.booking.value.canBookingAtSalon) return const SizedBox.shrink();
//           return BookingLocationOption(
//             title: AppStrings.atSalon.tr,
//             value: true,
//             groupValue: controller.atSalon.value,
//             onChanged: (value) {
//               controller.booking.update((val) {
//                 val.address = null;
//                 Get.put(TabBarController(), tag: 'addresses').selectedId.value = "";
//               });
//               controller.toggleAtSalon(value);
//             },
//           );
//         }),
//         Obx(() {
//           if (!controller.booking.value.canBookingAtCustomerAddress) return const SizedBox.shrink();
//           return BookingLocationOption(
//             title: AppStrings.atYourAddress.tr,
//             value: false,
//             groupValue: controller.atSalon.value,
//             onChanged: (value) {
//               controller.toggleAtSalon(value);
//             },
//           );
//         }),
//         Obx(() {
//           return AnimatedOpacity(
//             opacity: controller.atSalon.value ? 0 : 1,
//             duration: const Duration(milliseconds: 300),
//             child: AnimatedContainer(
//               height: controller.atSalon.value ? 0 : 230,
//               duration: const Duration(milliseconds: 300),
//               padding: EdgeInsets.symmetric(vertical: controller.atSalon.value ? 0 : AppPadding.p20),
//               color: AppColors.white,
//               child: AddressSelection(),
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }
//
// class BookingLocationOption extends StatelessWidget {
//   final String title;
//   final bool value;
//   final bool groupValue;
//   final void Function(bool) onChanged;
//
//   const BookingLocationOption({
//     required this.title,
//     required this.value,
//     required this.groupValue,
//     required this.onChanged,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     return Container(
//       color: AppColors.white,
//       child: RadioListTile(
//         activeColor: AppColors.primary,
//         value: value,
//         groupValue: groupValue,
//         onChanged: (value) => onChanged(value!),
//         title: CustomText(
//           title,
//           style: controller.getTextTheme(groupValue == value),
//         ).paddingSymmetric(vertical: AppPadding.p20),
//       ),
//     );
//   }
// }
//
// class AddressSelection extends StatelessWidget {
//   const AddressSelection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     return ListView(
//       primary: false,
//       shrinkWrap: true,
//       children: [
//         Row(
//           children: [
//             const HorizontalSpace(AppPadding.p20),
//             Expanded(
//               child: CustomText(
//                 AppStrings.yourAddresses.tr,
//                 style: Get.textTheme.bodyLarge,
//               ),
//             ),
//             const HorizontalSpace(AppPadding.p4),
//             MaterialButton(
//               padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p14),
//               onPressed: () {
//                 Get.toNamed(Routes.SETTINGS_ADDRESS_PICKER, arguments: {'fromHome': false});
//               },
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   color: AppColors.primary,
//                 ),
//                 borderRadius: BorderRadius.circular(AppSize.s8),
//               ),
//               color: AppColors.white,
//               child: Wrap(
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 spacing: AppPadding.p3,
//                 children: [
//                   CustomText(
//                     AppStrings.newAddress.tr,
//                     style: Get.textTheme.titleMedium!.copyWith(
//                       color: AppColors.primary,
//                     ),
//                   ),
//                   CustomIcon(Icons.add, color: AppColors.primary, size: AppSize.s20),
//                 ],
//               ),
//               elevation: 0,
//             ),
//             const HorizontalSpace(AppPadding.p20),
//           ],
//         ),
//         const VerticalSpace(AppSize.s10),
//         Row(
//           children: [
//             const HorizontalSpace(AppPadding.p20),
//             CustomIcon(Icons.place_outlined, color: Get.theme.focusColor),
//             const HorizontalSpace(AppPadding.p15),
//             Expanded(
//               child: Obx(() {
//                 return CustomText(
//                   controller.booking.value.address?.address ?? AppStrings.selectAddress.tr,
//                   style: Get.textTheme.bodyMedium,
//                 );
//               }),
//             ),
//             const HorizontalSpace(AppPadding.p20),
//           ],
//         ),
//         const VerticalSpace(AppSize.s15),
//         Obx(() {
//           if (controller.isLoadingAddress.value) {
//             return const TabBarLoadingWidget();
//           }
//           if (controller.addresses.isEmpty) {
//             return CustomEmptyListSmallWidget(
//               image: AppImages.emptyBooking,
//               title: AppStrings.noAddresses.tr,
//             );
//           } else {
//             return TabBarWidget(
//               initialSelectedId: "",
//               tag: 'addresses',
//               tabs: List.generate(controller.addresses.length, (index) {
//                 final address = controller.addresses[index];
//                 return ChipWidget(
//                   tag: 'addresses',
//                   text: address.getDescription,
//                   id: index,
//                   onSelected: (id) {
//                     controller.booking.update((val) {
//                       val.address = address;
//                     });
//                     Get.find<SettingsService>().address.value = address;
//                   },
//                 );
//               }),
//             );
//           }
//         }),
//       ],
//     );
//   }
// }
//
// class HintSection extends StatelessWidget {
//   const HintSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     return Container(
//       padding: const EdgeInsets.all(AppPadding.p12),
//       color: AppColors.white,
//       child: CustomTextField(
//         keyBoardType: TextInputType.multiline,
//         minLines: 3,
//         maxLines: 8,
//         onChanged: (input) => controller.booking.update((val) {
//           val.hint = input;
//         }),
//         labelText: AppStrings.hint.tr,
//       ),
//     );
//   }
// }
//
// class CouponSection extends StatelessWidget {
//   const CouponSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     return Container(
//       padding: const EdgeInsets.all(AppPadding.p12),
//       color: AppColors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Expanded(
//             child: CustomTextField(
//               labelText: AppStrings.couponCode.tr,
//               onChanged: (input) => controller.booking.update((val) {
//                 val.coupon.code = input;
//               }),
//               hintText: "COUPON01".tr,
//               prefix: CustomIcon.svg(AppIcons.ticket),
//             ),
//           ),
//           const HorizontalSpace(AppPadding.p12),
//           CustomButton(
//             height: AppSize.s40,
//             onPressed: controller.validateCoupon,
//             color: AppColors.primary,
//             child: CustomText(
//               AppStrings.apply.tr,
//               style: Get.textTheme.bodyLarge!.copyWith(color: AppColors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BookingSummaryButton extends StatelessWidget {
//   const BookingSummaryButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BookEServiceController>();
//     final setting = Get.find<SettingsService>();
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p12),
//       decoration: BoxDecoration(
//         color: Get.theme.primaryColor,
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.black.withOpacity(0.1),
//             offset: const Offset(0, -4),
//             blurRadius: AppSize.s18,
//           ),
//         ],
//       ),
//       child: Obx(() {
//         final canBook = controller.booking.value.bookingAt != null &&
//             (controller.booking.value.address != null || controller.booking.value.canBookingAtSalon) &&
//             Get.isRegistered<TabBarController>(tag: 'hours') &&
//             Get.find<TabBarController>(tag: 'hours').initialized &&
//             Get.find<TabBarController>(tag: 'hours').selectedId.value.isNotEmpty;
//         return Container(
//           padding: const EdgeInsets.all(AppPadding.p16),
//           decoration: BoxDecoration(color: AppColors.white),
//           child: CustomButton(
//             height: AppSize.s40,
//             text:
//                 "${AppStrings.bookWith.tr} ${controller.booking.value.getSubtotal() - controller.booking.value.getCouponValue()} ${setting.setting.value?.defaultCurrency}",
//             onPressed: canBook
//                 ? () async {
//                     await Get.toNamed(Routes.BOOKING_SUMMARY, arguments: {"salon": controller.booking.value.salon});
//                   }
//                 : null,
//           ),
//         );
//       }),
//     );
//   }
// }
