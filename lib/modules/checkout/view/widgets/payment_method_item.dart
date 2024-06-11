import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/booking/models/responses/payment_method_model.dart';
import 'package:brushes/modules/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodItem extends GetWidget<CheckoutController> {
  final PaymentMethod paymentMethod;

  const PaymentMethodItem(this.paymentMethod, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p4),
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
        decoration: BoxDecoration(
          color: paymentMethod.id == controller.selectedPaymentMethod.value?.id ? AppColors.primary : AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 5)),
          ],
        ),
        child: RadioListTile<int?>(
          activeColor: AppColors.white,
          value: paymentMethod.id,
          groupValue: controller.selectedPaymentMethod.value?.id,
          onChanged: (id) {
            controller.selectedPaymentMethod(controller.paymentMethods.firstWhere((pm) => pm.id == id));
            // if (value.wallet == null || value.wallet.balance >= controller.booking.value.getTotal()) {
            //   controller.selectPaymentMethod(value);
            // } else {
            //   Get.showSnackbar(Ui.ErrorSnackBar(message: "Price less than Total".tr, title: "Sorry"));
            // }
          },
          title: CustomText(
            Utils.localizedValue(context, paymentMethod.name),
            fontWeight: FontWeightManager.bold,
            color: controller.selectedPaymentMethod.value?.id == paymentMethod.id ? AppColors.white : null,
          ),
          subtitle: paymentMethod.wallet == null
              ? CustomText(
                  Utils.localizedValue(context, paymentMethod.description),
                  color: controller.selectedPaymentMethod.value?.id == paymentMethod.id ? AppColors.white : null,
                )
              : PriceWidget(myPrice: double.parse(Utils.localizedValue(context, paymentMethod.description))),
          secondary: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
            child: CustomImage(
              image: paymentMethod.logo.thumb,
              height: 60,
              width: 60,
              errorWidget: CustomIcon(
                Icons.error_outline,
                color: controller.selectedPaymentMethod.value?.id == paymentMethod.id ? AppColors.white : null,
              ),
            ),
          ),
        ),
      );
    });
  }
}
