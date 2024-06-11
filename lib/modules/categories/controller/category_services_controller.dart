import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/modules/categories/models/responses/category_model.dart';
import 'package:brushes/modules/e_service/models/responses/e_service_model.dart';
import 'package:brushes/modules/e_service/repositories/e_service_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/enums/category_filters.dart';
import '../../../core/services/error/failure.dart';

class CategoryServicesController extends GetxController {
  final EServiceRepo _eServiceRepo;

  CategoryServicesController(this._eServiceRepo);

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments["category"];
    color = Get.arguments["color"] ?? AppColors.primary;
  }

  late final CategoryModel category;
  late final Color color;
  RxList<EService> eServices = <EService>[].obs;
  Rx<CategoryFilter> selectedCategoryFilter = Rx<CategoryFilter>(CategoryFilter.all);

  Future<Either<Failure, PaginationModel<EService>>> getEServicesByCategory({int page = 1}) async {
    final result = await _eServiceRepo.getEServicesByCategory(category.id, selectedCategoryFilter.value, page: page);
    return result;
  }
}
