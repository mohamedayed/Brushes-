import '../../../../core/utils/utils.dart';
import '../../controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';
import '../widgets/service_with_cart_item.dart';

class SalonServices extends GetView<SalonDetailsController> {
  const SalonServices({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => controller.salonServices.isEmpty ? controller.getSalonServices() : null,
    );
    return CustomScrollView(
      slivers: [
        VerticalSpace.sliver(16),
        SliverToBoxAdapter(
          child: Obx(
            () {
              controller.selectedCategory.value;
              return controller.salonCategories.isEmpty
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 110,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => index == 0
                            ? GestureDetector(
                                onTap: () {
                                  controller.selectedCategory(0);
                                  controller.getSalonServices();
                                },
                                child: Container(
                                  height: 110,
                                  width: 76,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: controller.selectedCategory.value == 0
                                          ? AppColors.primary
                                          : AppColors.gray200,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const AspectRatio(aspectRatio: 1, child: CustomIcon(Icons.all_inclusive)),
                                      VerticalSpace(8),
                                      CustomText(
                                        AppStrings.all.tr,
                                        fontSize: 10,
                                        color: controller.selectedCategory.value == 0
                                            ? AppColors.primary
                                            : AppColors.black,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.selectedCategory(controller.salonCategories[index - 1].id);
                                  controller.getSalonServices();
                                },
                                child: Container(
                                  height: 110,
                                  width: 76,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          controller.selectedCategory.value == controller.salonCategories[index - 1].id
                                              ? AppColors.primary
                                              : AppColors.gray200,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1,
                                        child: CustomImage(
                                          image: controller.salonCategories[index - 1].image.url,
                                          width: 60,
                                          height: 60,
                                          borderRadius: 250,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      VerticalSpace(8),
                                      CustomText(
                                        Utils.localizedValue(context, controller.salonCategories[index - 1].name),
                                        fontSize: 10,
                                        color: controller.selectedCategory.value ==
                                                controller.salonCategories[index - 1].id
                                            ? AppColors.primary
                                            : AppColors.black,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        separatorBuilder: (context, index) => HorizontalSpace(10),
                        itemCount: controller.salonCategories.length + 1,
                      ),
                    );
            },
          ),
        ),
        const VerticalSpace.sliver(16),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: Obx(
            () => controller.isLoadingServices.value
                ? const SliverToBoxAdapter(child: LoadingSpinner())
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ServiceWithCartItem(service: controller.salonServices[index]),
                      childCount: controller.salonServices.length,
                    ),
                  ),
          ),
        ),
        const VerticalSpace.sliver(76),
      ],
    );
  }
}
