import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/sheets.dart';
import 'package:brushes/core/view/widgets/custom_icon.dart';
import 'package:brushes/core/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/view/views.dart';
import '../../../search/view/components/filter_bottom_sheet_widget.dart';
import 'notifications_button_widget.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.searchScreen),
                child: CustomTextField(
                  enabled: false,
                  hintText: AppStrings.searchForServices.tr,
                  prefix: SvgPicture.asset(AppIcons.search),
                  suffix: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.searchScreen);
                      AppSheets.showBottomSheet(context, child: const FilterBottomSheetWidget());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(AppPadding.p4)),
                        color: AppColors.gray200,
                      ),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4,
                        children: [
                          CustomText(AppStrings.filter.tr),
                          CustomIcon(Icons.filter_list, color: Get.theme.hintColor, size: 21),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const HorizontalSpace(8),
            const AspectRatio(aspectRatio: 1, child: NotificationsButtonWidget())
          ],
        ),
      ),
    );
  }
}
