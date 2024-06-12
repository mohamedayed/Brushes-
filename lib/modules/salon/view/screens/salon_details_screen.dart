import 'package:brushes/config/localization/l10n/l10n.dart';
import 'package:brushes/core/utils/dialogs.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/salon/controller/salon_details_controller.dart';
import 'package:brushes/modules/salon/view/components/reserved_items_bottom_widget.dart';
import 'package:brushes/modules/salon/view/components/salon_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../addresses/view/widgets/address_widget.dart';
import '../components/salon_details.dart';
import '../components/salon_services.dart';

class SalonDetailsScreen extends GetWidget<SalonDetailsController> {
  const SalonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isLoading.value
            ? const Scaffold(appBar: MainAppbar(title: ""), body: LoadingSpinner())
            : controller.salon.value == null
                ? const Scaffold(appBar: MainAppbar(title: ""))
                : WillPopScope(
                    onWillPop: () async {
                      AppDialogs.showAppDialog(
                        context,
                        dialog: ConfirmationDialog(title: AppStrings.leaveSalonPageHint.tr, onYes: Get.back),
                      );
                      return false;
                    },
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: CustomAppbar(
                          titleSpacing: 0,
                          showDefaultBackButton: false,
                          bgColor: AppColors.white,
                          title: IntrinsicHeight(
                            child: Row(
                              children: [
                                const HorizontalSpace(AppSize.s8),
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: OutlinedIconButton(
                                    icon: Icons.arrow_back,
                                    color: AppColors.gray200,
                                    onTap: () => AppDialogs.showAppDialog(
                                      context,
                                      dialog: ConfirmationDialog(
                                        title: AppStrings.leaveSalonPageHint.tr,
                                        onYes: Get.back,
                                      ),
                                    ),
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                ),
                                const HorizontalSpace(AppSize.s8),
                                const Expanded(child: AddressWidget(hasMargin: false, fromBookingScreen: false)),
                                const HorizontalSpace(AppSize.s8),
                              ],
                            ),
                          ),
                        ),
                        body: SafeArea(
                          child: Column(
                            children: [
                              Expanded(
                                child: NestedScrollView(
                                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                                    SliverAppBar(
                                      backgroundColor: AppColors.white,
                                      expandedHeight: 420,
                                      collapsedHeight: 0,
                                      toolbarHeight: 0,
                                      elevation: 0,
                                      automaticallyImplyLeading: false,
                                      stretch: true,
                                      pinned: true,
                                      flexibleSpace: const FlexibleSpaceBar(background: SalonHeader()),
                                      bottom: PreferredSize(
                                        preferredSize: Size(double.infinity, kTextTabBarHeight),
                                        child: Material(
                                          color: AppColors.white,
                                          child: TabBar(
                                            labelStyle: TextStyle(
                                              fontFamily: L10n.isAr(context)
                                                  ? FontConstants.arabicFontFamily
                                                  : FontConstants.englishFontFamily,
                                              fontWeight: FontWeightManager.bold,
                                            ),
                                            unselectedLabelColor: AppColors.grey,
                                            labelColor: AppColors.white,
                                            indicatorSize: TabBarIndicatorSize.tab,
                                            indicator: const BoxDecoration(color: AppColors.primary),
                                            tabs: [
                                              Tab(text: AppStrings.details.tr),
                                              Tab(text: AppStrings.services.tr),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  body: const TabBarView(children: [SalonDetails(), SalonServices()]),
                                ),
                              ),
                              const ReservedItemsBottomWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
      },
    );
  }
}
