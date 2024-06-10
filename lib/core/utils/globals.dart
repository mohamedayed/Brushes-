import 'package:get/get.dart';

import '../../config/configs/configs_model.dart';
import '../../modules/profile/models/responses/user_model.dart';

Rx<UserModel?> currentUser = Rx(null);
Rx<ConfigsModel?> configs = Rx(null);