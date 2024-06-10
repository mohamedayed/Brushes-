import 'package:get/get.dart';

import '../repositories/auth_repo.dart';

class PasswordChangedController extends GetxController {
  final AuthRepo _authRepo;

  PasswordChangedController(this._authRepo);
}
