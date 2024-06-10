import 'package:get/get.dart';

import '../extensions/non_null_extensions.dart';
import '../resources/resources.dart';
import 'validation_functions.dart';

class Validators {
  static String? numberValidator(String? input) {
    if (!isNumeric(input)) {
      return AppStrings.errMsgPleaseEnterValidNumber.tr;
    }
    return null;
  }

  static String? notEmptyValidator(String? input) {
    return input.orEmpty.isEmpty ? AppStrings.errMsgRequired.tr : null;
  }

  static String? emailValidator(String? input) {
    return !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input.orEmpty)
        ? AppStrings.errMsgPleaseEnterValidEmail.tr
        : null;
  }

  static String? passwordValidator(String? input, {bool isRequired = true}) {
    if (input == null || (!isValidPassword(input, isRequired: isRequired))) {
      return AppStrings.errMsgPleaseEnterValidPassword.tr;
    }
    return null;
  }

  static String? passwordConfirmationValidator(String? input, String? password) {
    if (input.orEmpty.isEmpty || password.orEmpty.isEmpty || input.orEmpty != password) {
      return AppStrings.errMsgPasswordsDontMatch.tr;
    }
    return null;
  }

  static String? nameValidator(String? input) {
    if (!isText(input, isRequired: true)) {
      return AppStrings.errMsgPleaseEnterValidText.tr;
    }
    return null;
  }

  static String? required(String? input) {
    if (input.orEmpty.isEmpty) {
      return AppStrings.errMsgRequired.tr;
    }
    return null;
  }

  static String? notEmptyIntValidator(int? input) {
    return input.orZero == 0 ? AppStrings.errMsgRequired.tr : null;
  }

  static String? phoneNumberValidator(String input, String example) {
    return input.orEmpty.length != example.length ? AppStrings.errMsgPleaseEnterValidNumber.tr : null;
  }
}
