import 'package:get/get.dart';

import '../repositories/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo _categoriesRepo;

  CategoriesController(this._categoriesRepo);
}
