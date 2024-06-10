import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/favourites_controller.dart';

class FavouritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<FavouritesController>());
  }
}
