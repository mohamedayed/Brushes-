import 'package:get/get.dart';

import '../repositories/products_repo.dart';

class ProductDetailsController extends GetxController {
  final ProductsRepo _productsRepo;

  ProductDetailsController(this._productsRepo);

  RxInt currentSlide = 0.obs;
}
