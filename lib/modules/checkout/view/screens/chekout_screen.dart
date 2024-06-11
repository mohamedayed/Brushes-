import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/checkout/view/components/checkout_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/checkout_controller.dart';
import '../widgets/payment_method_item.dart';

class CheckoutScreen extends GetWidget<CheckoutController> {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.checkout.tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Obx(
          () => controller.isLoading.value
              ? const LoadingSpinner()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: const CustomIcon(Icons.payment, color: AppColors.grey),
                        title: CustomText(
                          AppStrings.paymentOptions.tr,
                          maxLines: 1,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeightManager.bold,
                        ),
                        subtitle: CustomText(AppStrings.paymentOptionsHint.tr, fontSize: FontSize.s12),
                      ),
                    ),
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.paymentMethods.length,
                      separatorBuilder: (context, index) => const VerticalSpace(AppSize.s10),
                      itemBuilder: (context, index) => PaymentMethodItem(controller.paymentMethods[index]),
                    ),
                  ],
                ),
        ),
      ),
      bottomNavigationBar: const CheckoutBottomWidget(),
    );
  }
}
