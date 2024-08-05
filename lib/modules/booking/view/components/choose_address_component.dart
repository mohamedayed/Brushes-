import '../../../addresses/view/widgets/address_widget.dart';
import '../../controller/book_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class ChooseAddressComponent extends GetWidget<BookServiceController> {
  const ChooseAddressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          controller.atSalon.value;
          if (!controller.bookingBody.canBookAtSalon) return const SizedBox.shrink();
          return BookingLocationOption(
            title: AppStrings.atSalon.tr,
            value: true,
            groupValue: controller.atSalon.value,
            onChanged: (value) {
              controller.atSalon(value);
              controller.bookingBody.address = null;
            },
          );
        }),
        Obx(() {
          controller.atSalon.value;
          if (!controller.bookingBody.canBookAtCustomerAddress) return const SizedBox.shrink();
          return BookingLocationOption(
            title: AppStrings.atYourAddress.tr,
            value: false,
            groupValue: controller.atSalon.value,
            onChanged: (value) => controller.atSalon(value),
          );
        }),
        Obx(() {
          return AnimatedOpacity(
            opacity: (controller.atSalon.value ?? true) ? 0 : 1,
            duration: Time.t300ms,
            child: AnimatedContainer(
              height: (controller.atSalon.value ?? true) ? 0 : null,
              duration: Time.t300ms,
              padding: EdgeInsets.symmetric(
                vertical: (controller.atSalon.value ?? true) ? 0 : AppPadding.p20,
                horizontal: AppPadding.p12,
              ),
              color: AppColors.white,
              child: AddressWidget(
                fromBookingScreen: true,
                onAddressChanged: (address) => controller.bookingBody.copyWith(address: address),
              ),
            ),
          );
        }),
      ],
    );
  }
}

class BookingLocationOption extends StatelessWidget {
  final String title;
  final bool value;
  final bool? groupValue;
  final void Function(bool) onChanged;

  const BookingLocationOption({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: AppColors.primary,
      value: value,
      groupValue: groupValue,
      onChanged: (value) => onChanged(value!),
      title: CustomText(title, fontWeight: groupValue == value ? FontWeightManager.bold : FontWeightManager.medium),
    );
  }
}
