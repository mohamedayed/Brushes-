import 'package:brushes/core/resources/app_values.dart';
import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/home/controller/home_controller.dart';
import 'package:brushes/modules/home/view/components/home_categories.dart';
import 'package:brushes/modules/home/view/components/home_search_bar.dart';
import 'package:brushes/modules/home/view/components/home_services_component.dart';
import 'package:brushes/modules/home/view/components/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: SafeArea(
        child: Column(
          children: [
            VerticalSpace(8),
            HomeSearchBar(),
            VerticalSpace(AppSize.s12),
            // AddressWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Column(
                  children: [
                    const HomeSlider(),
                    const VerticalSpace(AppSize.s24),
                    HomeCategories(),
                    SizedBox(height: 18),
                    // Visibility(
                    //   //visible: !controller.salons.isEmpty,
                    //   child: Column(
                    //     children: [
                    //       TitleRow2(
                    //           title: "The nearest salons to you".tr,
                    //           onActionPressed: () => Get.toNamed(Routes.BRANCHES)),
                    //       SizedBox(height: 16),
                    //       Obx(() {
                    //         controller.salons.value;
                    //         return SizedBox(
                    //           height: 224,
                    //           child: ListView.separated(
                    //             padding: EdgeInsets.symmetric(horizontal: 16),
                    //             scrollDirection: Axis.horizontal,
                    //             itemBuilder: (context, index) =>
                    //                 BranchItem(flexibleDimensions: false, salon: controller.salons[index]),
                    //             separatorBuilder: (context, index) => SizedBox(width: 16),
                    //             itemCount: controller.salons.length,
                    //           ),
                    //         );
                    //       }),
                    //     ],
                    //   ),
                    // ),
                    const VerticalSpace(AppSize.s16),
                    Obx(
                          () => Column(
                        children: List.generate(
                          controller.featuredCategories.length,
                              (index) {
                            return Column(
                              children: [
                                const VerticalSpace(16),
                                HomeServicesComponent(
                                  title: Utils.localizedValue(context, controller.featuredCategories[index].name),
                                  services: controller.featuredCategories[index].eServices,
                                  // onActionPressed: () => Get.toNamed(Routes.CATEGORY, arguments: _category),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const VerticalSpace(AppSize.s16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
