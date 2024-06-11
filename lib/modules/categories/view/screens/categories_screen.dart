import 'dart:math';

import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/categories/controller/categories_controller.dart';
import 'package:brushes/modules/categories/view/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends GetWidget<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.categories.tr),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingSpinner()
            : controller.allCategories.isEmpty
                ? CustomEmptyListPageWidget(title: AppStrings.noCategoriesAvailable.tr)
                : GridView.builder(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: AppSize.s12,
                      childAspectRatio: 0.87,
                      crossAxisSpacing: AppSize.s12,
                    ),
                    itemCount: controller.allCategories.length,
                    itemBuilder: (context, index) => CategoryItem(
                      controller.allCategories[index],
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                  ),
      ),
    );
  }
}
