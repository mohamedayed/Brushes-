import 'package:brushes/config/navigation/navigation.dart';
import 'package:brushes/core/utils/constants.dart';
import 'package:brushes/modules/auth/view/components/blurry_bg.dart';
import 'package:brushes/modules/auth/view/components/social_auth_component.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/view/views.dart';
import '../../controller/sign_in_controller.dart';

class SignInScreen extends GetWidget<SignInController> {
  const SignInScreen({super.key});

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
                    const CustomText(Constants.appName, fontSize: FontSize.s28, fontWeight: FontWeight.bold),
                    CustomText(AppStrings.appDescription.tr, fontSize: FontSize.s16),
                    const VerticalSpace(AppSize.s24),
                    CustomText(AppStrings.welcome.tr, fontSize: FontSize.s26, fontWeight: FontWeight.bold),
                    CustomText(AppStrings.loginPrompt.tr, fontWeight: FontWeightManager.light),
                    const VerticalSpace(AppSize.s24),
                    CustomTextField(
                      hintText: AppStrings.emailHint.tr,
                      label: AppStrings.emailLabel.tr,
                      validator: Validators.emailValidator,
                      onChanged: (value) => controller.signInBody.copyWith(email: value),
                      prefix: const CustomIcon.svg(AppIcons.sms),
                    ),
                    const VerticalSpace(AppSize.s28),
                    Obx(
                      () => CustomTextField(
                        obscureText: !controller.showPassword.value,
                        hintText: AppStrings.passwordHint.tr,
                        label: AppStrings.passwordLabel.tr,
                        validator: Validators.passwordValidator,
                        keyBoardType: TextInputType.visiblePassword,
                        onChanged: (value) => controller.signInBody.copyWith(password: value),
                        prefix: const CustomIcon.svg(AppIcons.lock),
                        suffix: InkWell(
                          onTap: () => controller.toggleShowPassword(),
                          child: CustomIcon.svg(
                            controller.showPassword.value ? AppIcons.eyeSlash : AppIcons.eye,
                            size: AppSize.s16,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: CustomTextButton(text: AppStrings.forgotPassword.tr, onPressed: () {}),
                    ),
                    const VerticalSpace(AppSize.s36),
                    Obx(
                      () => CustomButton(
                        isLoading: controller.isLoading.value,
                        text: AppStrings.loginButton.tr,
                        textColor: AppColors.white,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          controller.signIn();
                        },
                      ),
                    ),
                    const VerticalSpace(AppSize.s16),
                    const SocialAuthComponent(),
                    const VerticalSpace(AppSize.s16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          AppStrings.newUser.tr,
                          fontSize: FontSize.s12,
                          color: Colors.grey,
                        ),
                        CustomTextButton(
                          text: AppStrings.createAccount.tr,
                          onPressed: () => Get.toNamed(Routes.signUpScreen),
                        ),
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
