import 'package:get/get.dart';

import '../repositories/products_repo.dart';

class BuyProductController extends GetxController {
  final ProductsRepo _productsRepo;

  BuyProductController(this._productsRepo);
}
