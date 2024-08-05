import '../../../../core/resources/app_values.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart' as sc;

class FilterBottomSheetWidget extends GetView<sc.SearchController> {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p24),
          child: Row(
            children: [
              Expanded(child: CustomText(AppStrings.filter.tr)),
              CustomButton(
                text: AppStrings.apply.tr,
                onPressed: () {
                  controller.searchEServices();
                  Get.back();
                },
              ),
            ],
          ),
        ),
        Obx(() {
          if (controller.categories.isEmpty) return const LoadingSpinner();
          return ExpansionTile(
            title: CustomText(AppStrings.categories.tr, fontWeight: FontWeightManager.bold),
            initiallyExpanded: true,
            children: List.generate(
              controller.categories.length,
              (index) => Obx(
                () => CheckboxListTile(
                  activeColor: AppColors.primary,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: controller.selectedCategories.contains(controller.categories[index].id),
                  onChanged: (value) => controller.toggleCategory(value ?? false, controller.categories[index]),
                  title: CustomText(
                    Utils.localizedValue(context, controller.categories[index].name),
                    fontWeight: FontWeightManager.semiBold,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
