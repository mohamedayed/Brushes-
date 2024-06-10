import 'package:get/get.dart';

import '../repositories/auth_repo.dart';

class ForgetPasswordController extends GetxController {
  final AuthRepo _authRepo;

  ForgetPasswordController(this._authRepo);
}
