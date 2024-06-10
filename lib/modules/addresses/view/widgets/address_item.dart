import 'package:brushes/core/services/address/address_service.dart';
import 'package:brushes/modules/addresses/controller/addresses_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../models/responses/address_model.dart';

class AddressItem extends GetWidget<AddressesController> {
  final Address address;

  const AddressItem(this.address, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.fromBookingScreen) {
          Get.back(result: address);
        } else {
          controller.setCurrentAddress(address);

        }
      },
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: CustomText(address.address, fontWeight: FontWeightManager.bold, fontSize: FontSize.s12),
        ),
      ),
    );
  }
}
