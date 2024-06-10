import 'package:get/get.dart';

import '../repositories/auth_repo.dart';

class OTPController extends GetxController {
  final AuthRepo _authRepo;

  OTPController(this._authRepo);
}