import 'package:get/get.dart';

import '../repositories/profile_repo.dart';

class ProfileController extends GetxController {
  final ProfileRepo _profileRepo;

  ProfileController(this._profileRepo);
}
