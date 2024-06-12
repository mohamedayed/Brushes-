import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/modules/booking/models/requests/booking_body.dart';
import 'package:brushes/modules/categories/models/responses/category_model.dart';
import 'package:brushes/modules/categories/repositories/categories_repo.dart';
import 'package:brushes/modules/e_service/models/responses/e_service_model.dart';
import 'package:brushes/modules/salon/models/responses/salon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/alerts.dart';
import '../repositories/salon_repo.dart';

class SalonDetailsController extends GetxController {
  final CategoriesRepo _categoriesRepo;
  final SalonRepo _salonRepo;

  SalonDetailsController(this._categoriesRepo, this._salonRepo);

  RxBool isLoading = false.obs;
  Rx<Salon?> salon = Rx<Salon?>(null);
  RxList<EService> selectedServices = <EService>[].obs;
  RxInt selectedCategory = 0.obs;
  RxList<CategoryModel> salonCategories = RxList<CategoryModel>([]);
  RxBool isLoadingServices = false.obs;
  RxList<EService> salonServices = RxList<EService>([]);
  final BookingBody bookingBody = BookingBody();
  late final int id;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    getSalon();
    bookingBody.copyWith(userId: currentUser.value!.id, eServices: [], options: [], quantity: 1);
  }

  Future<void> getSalon() async {
    isLoading(true);
    final result = await _salonRepo.getSalon(id);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getSalon),
      (salon) {
        this.salon(salon);
        bookingBody.copyWith(salon: salon);
        getSalonCategories();
      },
    );
    isLoading(false);
  }

  Future<void> getSalonCategories() async {
    final result = await _categoriesRepo.getSalonCategories(id);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getSalonCategories),
      (salonCategories) => this.salonCategories(salonCategories),
    );
  }

  Future<void> getSalonServices() async {
    salonServices.clear();
    isLoadingServices(true);
    final result = await _salonRepo.getSalonEServices(id, [selectedCategory.value]);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getSalonServices),
      (salonServices) => this.salonServices(salonServices),
    );
    isLoadingServices(false);
  }
}
