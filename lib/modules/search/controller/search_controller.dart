import '../../categories/models/responses/category_model.dart';
import '../../categories/repositories/categories_repo.dart';
import '../../e_service/models/responses/e_service_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../repositories/search_repo.dart';

class SearchController extends GetxController {
  final SearchRepo _searchRepo;
  final CategoriesRepo _categoriesRepo;

  SearchController(this._searchRepo, this._categoriesRepo);

  @override
  void onInit() {
    super.onInit();
    getParentCategories();
  }

  RxBool isLoading = false.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<int> selectedCategories = <int>[].obs;
  RxList<EService> eServices = <EService>[].obs;
  final TextEditingController textEditingController = TextEditingController();

  Future<void> getParentCategories() async {
    final result = await _categoriesRepo.getCategories(parent: true);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getParentCategories),
      (categories) => this.categories(categories),
    );
  }

  Future<void> searchEServices() async {
    eServices.clear();
    isLoading(true);
    final result = await _searchRepo.searchEServices(
      textEditingController.text.trim(),
      selectedCategories.isEmpty ? categories.map((c) => c.id).toList() : selectedCategories,
    );
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: searchEServices),
      (eServices) => this.eServices(eServices),
    );
    isLoading(false);
  }

  void toggleCategory(bool value, CategoryModel category) {
    if (value) {
      selectedCategories.add(category.id);
    } else {
      selectedCategories.removeWhere((element) => element == category.id);
    }
  }
}
