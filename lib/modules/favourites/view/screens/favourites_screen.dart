import 'package:brushes/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/view/views.dart';
import '../../controller/favourites_controller.dart';

class FavouritesScreen extends GetWidget<FavouritesController> {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.favourites.tr),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefix: CustomIcon(Icons.search),
                      hintText: AppStrings.searchForServices.tr,
                      onTap: () => Get.toNamed(Routes.searchScreen),
                    ),
                  ),
                ],
              ),
            ),
          ),
          VerticalSpace(8),
          Divider(height: 1, color: AppColors.gray200),
          // Expanded(
          //   child: Obx(() {
          //     if (Get.find<LaravelApiClient>().isLoading(task: 'getFavoritesEServices')) {
          //       return ServicesListLoaderWidget();
          //     } else if (controller.favorites.isEmpty) {
          //       return CustomEmptyListPageWidget(
          //         title: "There is no Any Favourites".tr,
          //         image: AppImages.emptyBooking,
          //         subtitle: "You haven't added any of your preferences yet".tr,
          //       );
          //     } else {
          //       return GridView.builder(
          //         padding: EdgeInsets.all(8),
          //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           mainAxisSpacing: 16,
          //           crossAxisSpacing: 16,
          //           childAspectRatio: 0.96,
          //         ),
          //         itemBuilder: (context, index) {
          //           var _favorite = controller.favorites.elementAt(index);
          //           return FavouriteItem(flexibleDimensions: true, favorite: _favorite);
          //         },
          //         itemCount: controller.favorites.length,
          //       );
          //     }
          //   }),
          // ),
        ],
      ),
    );
  }
}
