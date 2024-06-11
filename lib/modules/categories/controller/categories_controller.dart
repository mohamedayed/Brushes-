import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../models/responses/category_model.dart';
import '../repositories/categories_repo.dart';

class CategoriesController extends GetxController {
  final CategoriesRepo _categoriesRepo;

  CategoriesController(this._categoriesRepo);

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  RxBool isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  Future<void> getAllCategories() async {
    isLoading(true);
    final result = await _categoriesRepo.getCategories(parent: false);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getAllCategories),
      (allCategories) => this.allCategories(allCategories),
    );
    isLoading(false);
  }
}
