import '../../../../config/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/localization/l10n/l10n.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class PPAgreement extends StatelessWidget {
  const PPAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
        ),
        children: [
          TextSpan(
            text: AppStrings.termsAndConditionsNotice1.tr,
            style: const TextStyle(color: AppColors.gray300, fontSize: FontSize.s12),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.privacyPolicyScreen),
              child: CustomText(
                AppStrings.termsAndConditions.tr,
                height: 2,
                fontWeight: FontWeightManager.semiBold,
                fontSize: FontSize.s12,
              ),
            ),
          ),
          TextSpan(
            text: AppStrings.termsAndConditionsNotice2.tr,
            style: const TextStyle(color: AppColors.gray300, fontSize: FontSize.s12),
          ),
        ],
      ),
    );
  }
}
