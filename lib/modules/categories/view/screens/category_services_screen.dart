import '../../../../core/utils/utils.dart';
import '../../../../core/view/views.dart';
import '../widgets/category_item.dart';
import '../../../e_service/models/responses/e_service_model.dart';
import '../../../e_service/view/widgets/service_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/enums/category_filters.dart';
import '../../../../core/resources/resources.dart';
import '../../../search/view/widgets/service_grid_item.dart';
import '../../controller/category_services_controller.dart';

class CategoryServicesScreen extends GetWidget<CategoryServicesController> {
  const CategoryServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () => Get.toNamed(Routes.searchScreen),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: AppPadding.p8),
            child: CustomTextField(
              isDense: true,
              enabled: false,
              hintText: AppStrings.searchForServices.tr,
              prefix: const CustomIcon.svg(AppIcons.search),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: CategoryFilter.values.length,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: controller.color,
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Row(
                  children: [
                    SizedBox(
                      height: AppSize.s48,
                      width: AppSize.s48,
                      child: CategoryItem(controller.category, color: AppColors.white, clickable: false),
                    ),
                    const HorizontalSpace(AppSize.s12),
                    CustomText(
                      Utils.localizedValue(context, controller.category.name),
                      color: AppColors.white,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ],
                ),
              ),
              Obx(
                () => TabBar(
                  tabAlignment: TabAlignment.start,
                  onTap: (index) => controller.selectedCategoryFilter(CategoryFilter.values[index]),
                  indicator: BoxDecoration(color: controller.color),
                  unselectedLabelColor: Colors.black,
                  dividerHeight: AppSize.s0,
                  dividerColor: AppColors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  tabs: List.generate(
                    CategoryFilter.values.length,
                    (index) => Tab(
                      child: CustomText(
                        CategoryFilter.values[index].tabText,
                        color: controller.selectedCategoryFilter.value == CategoryFilter.values[index]
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  controller.selectedCategoryFilter.value;
                  return PaginatedGridView<EService>(
                    key: UniqueKey(),
                    padding: const EdgeInsets.all(AppPadding.p16),
                    fetchData: (page) => controller.getEServicesByCategory(page: page),
                    onGridItemsChange: (services) => controller.eServices(services),
                    child: (index) => ServiceGridItem(flexibleDimensions: true, service: controller.eServices[index]),
                    aspectRatio: 0.93,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
