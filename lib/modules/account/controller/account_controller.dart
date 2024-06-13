import 'package:get/get.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../../auth/repositories/auth_repo.dart';

class AccountController extends GetxController {
  final AuthRepo _authRepo;

  AccountController(this._authRepo);

  Future<void> signOut() async {
    final result = await _authRepo.signOut();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (_) {
        currentUser.value = null;
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
  }
}
