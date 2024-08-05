import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/globals.dart';
import '../../../../core/view/views.dart';
import '../../controller/salon_details_controller.dart';
import '../widgets/salon_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonCartScreen extends GetWidget<SalonDetailsController> {
  const SalonCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.salonCart.tr),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => controller.selectedServices.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                          child: CustomEmptyListPageWidget(title: AppStrings.cartIsEmpty.tr),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.all(12).copyWith(bottom: 84),
                        itemBuilder: (context, index) => SalonCartItem(
                          service: controller.bookingBody.eServices![index],
                          onRemoveFromCart: () {
                            controller.selectedServices
                                .removeWhere((s) => s.id == controller.bookingBody.eServices![index].id);
                            controller.selectedServices.refresh();
                          },
                        ),
                        separatorBuilder: (context, index) => VerticalSpace(10),
                        itemCount: controller.bookingBody.eServices!.length,
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.white),
              child: Obx(
                () => controller.selectedServices.isEmpty
                    ? const SizedBox()
                    : CustomButton(
                        height: 40,
                        text:
                            "${AppStrings.bookWith.tr} ${controller.bookingBody.subtotal.toStringAsFixed(2)} ${configs.value!.defaultCurrency}",
                        onPressed: () {
                          Get.toNamed(Routes.bookServiceScreen, arguments: {'booking_body': controller.bookingBody});
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
