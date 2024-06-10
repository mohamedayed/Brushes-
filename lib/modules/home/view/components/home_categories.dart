import 'dart:math';

import 'package:brushes/modules/home/controller/home_controller.dart';
import 'package:brushes/modules/home/view/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import 'title_row.dart';

class HomeCategories extends GetWidget<HomeController> {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.categories.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                TitleRow(
                  title: AppStrings.services.tr,
                  viewMoreColor: AppColors.warning,
                  onActionPressed: () => Get.toNamed(Routes.categoriesScreen),
                ),
                const VerticalSpace(AppSize.s16),
                SizedBox(
                  height: 82,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryItem(
                      controller.categories[index],
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    ),
                    separatorBuilder: (context, index) => const HorizontalSpace(AppSize.s12),
                    itemCount: controller.categories.length,
                  ),
                ),
              ],
            ),
    );
  }
}
