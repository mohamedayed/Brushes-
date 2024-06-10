import 'package:brushes/modules/auth/controller/social_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../../../../di_container.dart';

class SocialAuthComponent extends StatelessWidget {
  const SocialAuthComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialAuthController>(
      init: sl<SocialAuthController>(),
      builder: (controller) => Column(
        children: [
          Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: CustomText(AppStrings.or.tr),
              ),
              const Expanded(child: Divider()),
            ],
          ),
          const VerticalSpace(AppSize.s16),
          Obx(
            () => SocialAuthButton(
              title: AppStrings.googleLogin.tr,
              icon: AppIcons.google,
              isLoading: controller.isSigningInWithGoogle.value,
              onPressed: controller.googleSignIn,
            ),
          ),
          const VerticalSpace(AppSize.s16),
          Obx(
            () => SocialAuthButton(
              title: AppStrings.facebookLogin.tr,
              icon: AppIcons.facebook,
              isLoading: controller.isSigningInWithFacebook.value,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isLoading;
  final VoidCallback onPressed;

  const SocialAuthButton({
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,
      spinnerColor: AppColors.black,
      isOutlined: true,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIcon.svg(icon),
          const HorizontalSpace(AppSize.s8),
          CustomText(title, fontSize: FontSize.s12),
        ],
      ),
    );
  }
}
