import 'package:get/get.dart';

import '../repositories/favourites_repo.dart';

class FavouritesController extends GetxController {
  final FavouritesRepo _favouritesRepo;

  FavouritesController(this._favouritesRepo);
}
