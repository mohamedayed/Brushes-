import 'package:brushes/core/view/components/phone_number_text_field.dart';
import 'package:brushes/modules/auth/view/components/pp_agreement.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/view/views.dart';
import '../../controller/sign_up_controller.dart';
import '../components/blurry_bg.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BlurryBG(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const Row(children: [DefaultBackButton(icon: Icons.close_rounded)]),
                    CustomText(AppStrings.createAccountTitle.tr, fontSize: FontSize.s28, fontWeight: FontWeight.bold),
                    CustomText(AppStrings.createAccountSubtitle.tr, fontSize: FontSize.s16),
                    const VerticalSpace(AppSize.s24),
                    CustomTextField(
                      hintText: AppStrings.fullNameExample.tr,
                      label: AppStrings.fullName.tr,
                      keyBoardType: TextInputType.name,
                      validator: Validators.notEmptyValidator,
                      onChanged: (value) => controller.signUpBody.copyWith(name: value),
                      prefix: const CustomIcon.svg(AppIcons.user),
                    ),
                    const VerticalSpace(AppSize.s24),
                    CustomTextField(
                      hintText: AppStrings.emailHint.tr,
                      label: AppStrings.emailLabel.tr,
                      validator: Validators.emailValidator,
                      onChanged: (value) => controller.signUpBody.copyWith(email: value),
                      prefix: const CustomIcon.svg(AppIcons.sms),
                    ),
                    const VerticalSpace(AppSize.s24),
                    PhoneNumberTextField(
                      onSelectCountry: (country) => controller.signUpBody.copyWith(countryCode: country.phoneCode),
                      onChanged: (value) => controller.signUpBody.copyWith(phoneNumber: value),
                    ),
                    const VerticalSpace(AppSize.s24),
                    Obx(
                      () => CustomTextField(
                        obscureText: !controller.showPassword.value,
                        hintText: AppStrings.passwordHint.tr,
                        label: AppStrings.passwordLabel.tr,
                        validator: Validators.passwordValidator,
                        keyBoardType: TextInputType.visiblePassword,
                        onChanged: (value) => controller.signUpBody.copyWith(password: value),
                        prefix: const CustomIcon.svg(AppIcons.lock),
                        suffix: InkWell(
                          onTap: () => controller.toggleShowPassword(),
                          child: CustomIcon.svg(controller.showPassword.value ? AppIcons.eyeSlash : AppIcons.eye),
                        ),
                      ),
                    ),
                    const VerticalSpace(AppSize.s24),
                    Obx(
                      () => CustomTextField(
                        obscureText: !controller.showReEnterPassword.value,
                        hintText: AppStrings.passwordHint.tr,
                        label: AppStrings.confirmPassword.tr,
                        validator: (input) =>
                            Validators.passwordConfirmationValidator(input, controller.signUpBody.password),
                        keyBoardType: TextInputType.visiblePassword,
                        prefix: const CustomIcon.svg(AppIcons.lock),
                        suffix: InkWell(
                          onTap: () => controller.toggleShowReEnterPassword(),
                          child: CustomIcon.svg(
                            controller.showReEnterPassword.value ? AppIcons.eyeSlash : AppIcons.eye,
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(AppSize.s36),
                    Obx(
                      () => CustomButton(
                        isLoading: controller.isLoading.value,
                        text: AppStrings.createAccount.tr,
                        textColor: AppColors.white,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.signUp();
                        },
                      ),
                    ),
                    const VerticalSpace(AppSize.s28),
                    const PPAgreement(),
                    const VerticalSpace(AppSize.s16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(AppStrings.alreadyHaveAccount.tr, fontSize: FontSize.s12, color: Colors.grey),
                        CustomTextButton(text: AppStrings.doLogin.tr, onPressed: Get.back),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
