import '../../../config/navigation/routes.dart';
import '../../auth/repositories/auth_repo.dart';
import 'package:get/get.dart';

import '../../../config/configs/configs_repo.dart';
import '../../../core/resources/resources.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/globals.dart';
import '../../profile/repositories/profile_repo.dart';

class SplashController extends GetxController {
  final ConfigsRepo _configsRepo;
  final ProfileRepo _profileRepo;
  final AuthRepo _authRepo;

  SplashController(this._configsRepo, this._profileRepo, this._authRepo);

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Time.t1s, getConfigs);
  }

  void fetchAndRedirect() {
    if (_authRepo.isAuthed) {
      getProfile();
    } else {
      Get.offAllNamed(Routes.layoutScreen);
    }
  }

  Future<void> getConfigs() async {
    isLoading(true);
    final result = await _configsRepo.getConfigs();
    result.fold(
      (failure) {
        Alerts.showSnackBar(message: failure.message, onActionPressed: getConfigs);
        isLoading(false);
      },
      (appConfigs) {
        configs.value = appConfigs;
        fetchAndRedirect();
      },
    );
  }

  Future<void> getProfile() async {
    final result = await _profileRepo.getProfile();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getProfile),
      (user) {
        currentUser(user);
        Get.offAllNamed(Routes.layoutScreen);
      },
    );
    isLoading(false);
  }
}
