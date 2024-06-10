import 'package:get/get.dart';

import '../repositories/auth_repo.dart';

class NewPasswordController extends GetxController {
  final AuthRepo _authRepo;

  NewPasswordController(this._authRepo);
}
