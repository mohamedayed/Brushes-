import 'dart:math';

import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/home/controller/home_controller.dart';
import 'package:brushes/modules/home/view/components/home_categories.dart';
import 'package:brushes/modules/home/view/components/home_search_bar.dart';
import 'package:brushes/modules/home/view/components/home_services_component.dart';
import 'package:brushes/modules/home/view/components/home_slider.dart';
import 'package:brushes/modules/salon/view/widgets/salon_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/view/views.dart';
import '../components/title_row.dart';
import '../../../addresses/view/widgets/address_widget.dart';

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
            VerticalSpace(AppSize.s8),
            AddressWidget(fromBookingScreen: false),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Column(
                  children: [
                    const HomeSlider(),
                    const VerticalSpace(AppSize.s16),
                    const HomeCategories(),
                    const VerticalSpace(AppSize.s24),
                    Column(
                      children: [
                        TitleRow(
                          title: AppStrings.nearestSalons.tr,
                          viewMoreColor: AppColors.warning,
                          onActionPressed: () {},
                        ),
                        const VerticalSpace(AppSize.s16),
                        Obx(
                          () => SizedBox(
                            height: 224,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  SalonItem(flexibleDimensions: false, salon: controller.salons[index]),
                              separatorBuilder: (context, index) => SizedBox(width: 16),
                              itemCount: controller.salons.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpace(AppSize.s16),
                    Obx(
                      () => Column(
                        children: List.generate(
                          controller.featuredCategories.length,
                          (index) {
                            final Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                            return Column(
                              children: [
                                if (index != 0) const VerticalSpace(16),
                                HomeServicesComponent(
                                  title: Utils.localizedValue(context, controller.featuredCategories[index].name),
                                  services: controller.featuredCategories[index].eServices,
                                  onActionPressed: () => Get.toNamed(
                                    Routes.categoryServicesScreen,
                                    arguments: {"category": controller.featuredCategories[index], "color": color},
                                  ),
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
