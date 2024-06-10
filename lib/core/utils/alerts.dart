import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../resources/resources.dart';
import '../view/views.dart';

class Alerts {
  static void showSnackBar({
    required String message,
    String actionText = AppStrings.retry,
    VoidCallback? onActionPressed,
    Duration? duration,
    bool forError = true,
  }) {
    if (Get.isSnackbarOpen) Get.back();
    Get.showSnackbar(
      GetSnackBar(
        duration: duration ?? (onActionPressed == null ? Time.t3s : Time.longTime),
        backgroundColor: forError ? AppColors.warning : AppColors.black,
        message: message,
        animationDuration: Time.t300ms,
        borderRadius: AppSize.s6,
        margin: const EdgeInsets.all(AppPadding.p16),
        mainButton: onActionPressed != null
            ? CustomTextButton(
                text: actionText.tr,
                onPressed: () {
                  Get.back();
                  onActionPressed();
                },
                textColor: AppColors.white,
              )
            : null,
      ),
    );
  }

  static void showToast(
    String message, [
    Toast length = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  ]) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: toastGravity,
      timeInSecForIosWeb: 3,
      fontSize: FontSize.s14,
    );
  }
}
