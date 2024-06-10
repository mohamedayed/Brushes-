import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../models/requests/sign_up_body.dart';
import '../repositories/auth_repo.dart';

class SignUpController extends GetxController {
  final AuthRepo _authRepo;

  SignUpController(this._authRepo);

  RxBool showPassword = false.obs;
  RxBool showReEnterPassword = false.obs;
  RxBool isLoading = false.obs;
  final SignUpBody signUpBody = SignUpBody();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleShowPassword() => showPassword.value = !showPassword.value;

  void toggleShowReEnterPassword() => showReEnterPassword.value = !showReEnterPassword.value;

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _authRepo.signUp(signUpBody);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (userModel) {
        currentUser(userModel);
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
    isLoading(false);
  }
}
