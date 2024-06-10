import 'package:get/get.dart';
import '../../../core/utils/alerts.dart';
import '../repositories/social_auth_repo.dart';

import '../../../config/navigation/navigation.dart';
import '../../../core/utils/globals.dart';

class SocialAuthController extends GetxController {
  final SocialAuthRepo _socialAuthRepo;

  SocialAuthController(this._socialAuthRepo);

  RxBool isSigningInWithGoogle = false.obs;
  RxBool isSigningInWithFacebook = false.obs;

  Future<void> googleSignIn() async {
    final account = await _socialAuthRepo.getGoogleAccount();
    if (account == null) return;
    isSigningInWithGoogle(true);
    final result = await _socialAuthRepo.googleSignIn(account);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message),
      (userModel) {
        currentUser(userModel);
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
    isSigningInWithGoogle(false);
  }

// Future<void> facebookSignIn(int type) async {
//   final userData = await _socialAuthRepo.getFacebookAccount();
//   isSigningInWithFacebook(true);
//   final result = await _socialAuthRepo.facebookSignIn(userData,type);
//   result.fold(
//     (failure) => Alerts.showSnackBar(message: failure.message),
//     (userModel) {
//       currentUser.value = userModel;
//       Get.offAllNamed(userModel.type == UserType.student ? Routes.layoutScreen : Routes.accountScreen);
//     },
//   );
//   isSigningInWithFacebook(false);
// }
}
