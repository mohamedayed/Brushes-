import 'package:get/get.dart';

import '../../../core/utils/alerts.dart';
import '../../categories/models/responses/category_model.dart';
import '../../categories/repositories/categories_repo.dart';
import '../../salon/models/responses/salon_model.dart';
import '../repositories/home_repo.dart';
import 'package:brushes/modules/home/models/responses/home_slider_model.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo;
  final CategoriesRepo _categoriesRepo;

  HomeController(this._homeRepo, this._categoriesRepo);

  RxInt currentSlide = 0.obs;
  RxList<HomeSliderModel> sliders = <HomeSliderModel>[].obs;
  RxList<Salon> salons = <Salon>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  Future<void> getHomeSliders() async {
    final result = await _homeRepo.getHomeSliders();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getHomeSliders),
      (sliders) => this.sliders(sliders),
    );
  }

  Future<void> getParentCategories() async {
    final result = await _categoriesRepo.getAllParentCategories();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getParentCategories),
      (categories) => this.categories(categories),
    );
  }

  Future<void> getFeaturedCategories() async {
    final result = await _homeRepo.getFeaturedCategories();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getFeaturedCategories),
      (categories) => featuredCategories(categories),
    );
  }
}
