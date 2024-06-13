import 'package:brushes/core/utils/globals.dart';
import 'package:get/get.dart';

import '../models/requests/edit_profile_body.dart';
import '../repositories/profile_repo.dart';

class ProfileController extends GetxController {
  final ProfileRepo _profileRepo;

  ProfileController(this._profileRepo);

  late final EditProfileBody editProfileBody;

  @override
  void onInit() {
    super.onInit();
    editProfileBody = EditProfileBody(
      name: currentUser.value!.name,
      image: currentUser.value!.avatar.url,
      email: currentUser.value!.email,
      countryCode: currentUser.value!.phoneNumber.isEmpty ? null : currentUser.value!.phoneNumber.split(" ")[0],
      phoneNumber:
          currentUser.value!.phoneNumber.isEmpty ? null : currentUser.value!.phoneNumber.split(" ").sublist(1).join(),
    );
  }
}
