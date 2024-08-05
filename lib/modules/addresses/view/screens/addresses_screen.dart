import '../../controller/addresses_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/address_item.dart';

class AddressesScreen extends GetWidget<AddressesController> {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.addresses.tr),
      body: Obx(
        () {
          controller.addresses.value;
          return controller.isLoading.value
              ? const LoadingSpinner()
              : controller.addresses.isEmpty
                  ? CustomEmptyListPageWidget(image: AppImages.emptyBooking, title: AppStrings.noAddresses.tr)
                  : ListView.separated(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      itemBuilder: (context, index) => AddressItem(controller.addresses[index]),
                      itemCount: controller.addresses.length,
                      separatorBuilder: (context, index) => const Divider(height: AppSize.s1),
                    );
        },
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: controller.isAdding.value
              ? const LoadingSpinner(hasSmallRadius: true, color: AppColors.white)
              : const CustomIcon(Icons.add),
          onPressed: () async {
            if (controller.isAdding.value) return;
            final address = await Get.toNamed(Routes.chooseOnMapScreen);
            controller.addAddress(address);
          },
        ),
      ),
    );
  }
}
