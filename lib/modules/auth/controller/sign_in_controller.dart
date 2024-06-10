import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../models/requests/sign_in_body.dart';
import '../repositories/auth_repo.dart';

class SignInController extends GetxController {
  final AuthRepo _authRepo;

  SignInController(this._authRepo);

  RxBool showPassword = false.obs;
  RxBool isLoading = false.obs;
  final SignInBody signInBody = SignInBody();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleShowPassword() => showPassword.value = !showPassword.value;

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _authRepo.signIn(signInBody);
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
