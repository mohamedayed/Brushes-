import '../../../../core/resources/resources.dart';
import '../../../../core/view/components/phone_number_text_field.dart';
import '../../../../core/view/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';
import '../../controller/profile_controller.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.editProfile.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomImage(image: "", width: 120, height: 120, borderRadius: 250),
                    PositionedDirectional(
                      bottom: -16,
                      start: 0,
                      end: 0,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(shape: CircleBorder(), color: AppColors.grey100),
                        child: CustomIcon.svg(AppIcons.camera),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpace(16),
              CustomTextField(
                label: AppStrings.fullName.tr,
                initialValue: controller.editProfileBody.name,
                prefix: CustomIcon.svg(AppIcons.user),
              ),
              VerticalSpace(AppSize.s20),
              CustomTextField(
                label: AppStrings.emailLabel.tr,
                initialValue: controller.editProfileBody.email,
                prefix: CustomIcon.svg(AppIcons.sms),
              ),
              VerticalSpace(AppSize.s20),
              PhoneNumberTextField(
                initialCountryCode: controller.editProfileBody.countryCode,
                initialPhoneNumber: controller.editProfileBody.phoneNumber,
                onChanged: (value) {},
                onSelectCountry: (country) {},
              ),
              VerticalSpace(30),
              CustomText("تغيير كلمة المرور", fontSize: 14, fontWeight: FontWeight.w700),
              CustomText(
                "إملاء كلمة المرور القديمة واكتب كلمة المرور الجديدة وقم بتأكيدها",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              VerticalSpace(30),
              CustomText("كلمة المرور القديمة", fontSize: 12),
              VerticalSpace(10),
              CustomTextField(initialValue: "**********", prefix: CustomIcon.svg(AppIcons.lock)),
              VerticalSpace(28),
              CustomText("كلمة المرور الجديدة", fontSize: 12),
              VerticalSpace(10),
              CustomTextField(initialValue: "**********", prefix: CustomIcon.svg(AppIcons.lock)),
              VerticalSpace(28),
              CustomText("تأكيد كلمة المرور الجديدة", fontSize: 12),
              VerticalSpace(10),
              CustomTextField(initialValue: "**********", prefix: CustomIcon.svg(AppIcons.lock)),
              VerticalSpace(32),
              CustomButton(text: "حفظ", onPressed: () {}),
              VerticalSpace(10),
              CustomButton(
                isOutlined: true,
                text: AppStrings.deleteAccount.tr,
                textColor: AppColors.warning,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
