import '../../../../core/services/address/address_service.dart';
import '../../../../core/utils/utils.dart';
import '../../models/responses/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class AddressWidget extends StatefulWidget {
  final void Function(Address?)? onAddressChanged;
  final bool hasMargin;
  final bool fromBookingScreen;

  const AddressWidget({
    super.key,
    required this.fromBookingScreen,
    this.onAddressChanged,
    this.hasMargin = true,
  });

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  Address? address;

  @override
  void initState() {
    super.initState();
    if (AddressService.currentAddress.value != null && widget.onAddressChanged != null) {
      address = AddressService.currentAddress.value;
      widget.onAddressChanged!(AddressService.currentAddress.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.invokeIfAuthenticated(
        callback: () async {
          final result =
              await Get.toNamed(Routes.addressesScreen, arguments: {"from_booking_screen": widget.fromBookingScreen});
          if (result != null && widget.onAddressChanged != null) {
            setState(() => address = result);
            widget.onAddressChanged!(result);
          }
        },
      ),
      child: Container(
        margin: widget.hasMargin ? const EdgeInsets.symmetric(vertical: 0, horizontal: AppPadding.p8) : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.gray250), borderRadius: BorderRadius.circular(6.0)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(6.0)),
              child: const CustomIcon.svg(AppIcons.location, color: AppColors.address, size: 18),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(AppStrings.yourLocation.tr, fontSize: 12),
                  const VerticalSpace(2),
                  Obx(
                    () {
                      AddressService.currentAddress.value;
                      if (address != null) {
                        return CustomText(
                          address!.address,
                          maxLines: 1,
                          color: AppColors.address,
                          fontSize: FontSize.s12,
                        );
                      }

                      if (AddressService.currentAddress.value == null) {
                        return CustomText(AppStrings.addressNotAvailable.tr, maxLines: 1, fontSize: FontSize.s12);
                      }
                      return CustomText(
                        AddressService.currentAddress.value!.address,
                        maxLines: 1,
                        color: AppColors.address,
                        fontSize: FontSize.s12,
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            CustomIcon(Icons.arrow_forward_ios, size: 16, color: AppColors.address)
          ],
        ),
      ),
    );
  }
}
