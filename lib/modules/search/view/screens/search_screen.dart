import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/sheets.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/search/view/widgets/service_grid_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/search_controller.dart' as sc;
import '../components/filter_bottom_sheet_widget.dart';

class SearchScreen extends GetView<sc.SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: AppStrings.searchForSalon.tr,
        actions: [
          GestureDetector(
            onTap: () => AppSheets.showBottomSheet(context, child: const FilterBottomSheetWidget()),
            child: CustomIcon(Icons.filter_list, color: Get.theme.hintColor, size: 21),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
            child: CustomTextField(
              hintText: AppStrings.searchForServices.tr,
              controller: controller.textEditingController,
              onSubmitted: (value) => controller.searchEServices(),
              prefix: SvgPicture.asset(AppIcons.search),
            ),
          ),
          const VerticalSpace(AppSize.s12),
          const Divider(height: AppSize.s1),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const LoadingSpinner()
                  : GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(AppPadding.p16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.93,
                      ),
                      itemBuilder: (context, index) =>
                          ServiceGridItem(flexibleDimensions: true, service: controller.eServices[index]),
                      itemCount: controller.eServices.length,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
