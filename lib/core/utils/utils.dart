import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/localization/l10n/l10n.dart';
import '../../config/navigation/navigation.dart';
import '../base/models/en_ar_model.dart';
import '../resources/resources.dart';
import '../view/views.dart';
import 'globals.dart';

class Utils {
  static void invokeIfAuthenticated({required Function callback, Function? beforeAuthCallback}) {
    if (currentUser.value != null) {
      callback();
    } else {
      Get.dialog(
        ConfirmationDialog(
          title: AppStrings.notLoggedInDesc.tr,
          onYes: () {
            if (beforeAuthCallback != null) beforeAuthCallback();
            Get.toNamed(Routes.signInScreen);
          },
          cancellationText: AppStrings.cancel.tr,
          confirmationText: AppStrings.signIn.tr,
        ),
      );
    }
  }

  static String localizedValue(BuildContext context, EnArModel enArModel) =>
      L10n.isAr(context) ? enArModel.ar : enArModel.en;
}
