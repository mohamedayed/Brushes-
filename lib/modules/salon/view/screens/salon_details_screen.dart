import 'package:brushes/core/utils/dialogs.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/salon/controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/utils/units_utils.dart';
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
                                      flexibleSpace: FlexibleSpaceBar(
                                        background: Column(
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional.bottomCenter,
                                              children: [
                                                SizedBox(
                                                  height: 175,
                                                  child: PageView.builder(
                                                    controller: controller.pageController,
                                                    itemBuilder: (context, index) => CustomImage(
                                                      image: controller.salon.value!.images[index].url,
                                                      height: 175,
                                                      width: double.infinity,
                                                    ),
                                                    itemCount: controller.salon.value!.images.length,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 8),
                                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: AppColors.white,
                                                  ),
                                                  child: SmoothPageIndicator(
                                                    controller: controller.pageController,
                                                    effect: const WormEffect(
                                                      activeDotColor: AppColors.primary,
                                                      dotColor: AppColors.gray200,
                                                      dotHeight: 6,
                                                      dotWidth: 6,
                                                    ),
                                                    count: controller.salon.value!.images.length,
                                                  ),
                                                )
                                              ],
                                            ),
                                            VerticalSpace(12),
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CustomImage(
                                                    image: controller.salon.value!.images[0].url,
                                                    width: 60,
                                                    height: 60,
                                                    borderRadius: 200,
                                                  ),
                                                  HorizontalSpace(4),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: CustomText(
                                                                Utils.localizedValue(
                                                                    context, controller.salon.value!.name),
                                                                fontWeight: FontWeightManager.semiBold,
                                                              ),
                                                            ),
                                                            HorizontalSpace(4),
                                                            Row(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                CustomIcon.svg(AppIcons.location, size: AppSize.s12),
                                                                HorizontalSpace(4),
                                                                CustomText(
                                                                  UnitsUtils.getDistance(
                                                                      controller.salon.value!.distance.toDouble()),
                                                                  fontSize: 10,
                                                                  maxLines: 1,
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            RatingBar(
                                                              initialRating: controller.salon.value!.rate.toDouble(),
                                                              direction: Axis.horizontal,
                                                              itemCount: 5,
                                                              ignoreGestures: true,
                                                              allowHalfRating: true,
                                                              itemPadding: EdgeInsets.zero,
                                                              onRatingUpdate: (value) {},
                                                              itemSize: 20,
                                                              ratingWidget: RatingWidget(
                                                                full: const CustomIcon(Icons.star_rounded,
                                                                    size: 16, color: AppColors.ratingStar),
                                                                empty: const CustomIcon(Icons.star_outline_rounded,
                                                                    size: 16, color: AppColors.gray200),
                                                                half:
                                                                    const CustomIcon(Icons.star_half_rounded, size: 16),
                                                              ),
                                                            ),
                                                            HorizontalSpace(4),
                                                            CustomText(
                                                              controller.salon.value!.rate.toStringAsFixed(2),
                                                              height: 0,
                                                            ),
                                                            Spacer(),
                                                            SizedBox(
                                                              width: 72,
                                                              height: 32,
                                                              child: Stack(
                                                                children: List.generate(
                                                                  controller.salon.value!.reviews.length > 3
                                                                      ? 3
                                                                      : controller.salon.value!.reviews.length,
                                                                  (index) => PositionedDirectional(
                                                                    end: (index * 16).toDouble(),
                                                                    child: Container(
                                                                      height: 32,
                                                                      width: 32,
                                                                      decoration: BoxDecoration(
                                                                        border: Border.all(
                                                                            color: AppColors.white, width: 2),
                                                                        borderRadius: BorderRadius.circular(250),
                                                                        image: DecorationImage(
                                                                          fit: BoxFit.cover,
                                                                          image: NetworkImage(
                                                                            controller.salon.value!.reviews[index]
                                                                                .booking.user.avatar.url,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            CustomText("+${controller.salon.value!.totalReviews}")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            VerticalSpace(20),
                                            if (controller.salon.value!.description.isNotEmpty)
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 12),
                                                child: CustomText(
                                                  controller.salon.value!.description,
                                                  maxLines: 6,
                                                ),
                                              ),
                                            if (controller.salon.value!.description.isNotEmpty) VerticalSpace(20),
                                          ],
                                        ),
                                      ),
                                      bottom: PreferredSize(
                                        preferredSize: Size(double.infinity, kTextTabBarHeight),
                                        child: Material(
                                          color: AppColors.white,
                                          child: TabBar(
                                            unselectedLabelColor: AppColors.grey,
                                            labelColor: AppColors.primary,
                                            indicator: const UnderlineTabIndicator(
                                              borderSide: BorderSide(color: AppColors.primary),
                                            ),
                                            tabs: [
                                              Tab(text: AppStrings.details.tr),
                                              Tab(text: AppStrings.services.tr),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  body: TabBarView(children: [SalonDetails(), SalonServices()]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.1),
                                      offset: const Offset(0, -4),
                                      blurRadius: 18,
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomText(
                                            AppStrings.salonCart.tr,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primary,
                                          ),
                                          const VerticalSpace(4),
                                          Obx(
                                            () => CustomText(
                                              "${controller.numberOfReservedServices.value} ${AppStrings.elementAdded.tr}",
                                              fontSize: 12,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomButton(
                                      text: AppStrings.reserveItems.tr,
                                      onPressed: () => Utils.invokeIfAuthenticated(
                                        callback: () {
                                          // var _booking = Get.find<SalonEServicesController>().booking.value;
                                          // Get.toNamed(Routes.CART, arguments: {'booking': _booking});
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
