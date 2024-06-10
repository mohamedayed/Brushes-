import 'package:brushes/config/navigation/navigation.dart';
import 'package:brushes/core/utils/globals.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/e_service/controller/e_service_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resources/resources.dart';
import '../../models/responses/option_model.dart';

class EServiceDetailsScreen extends GetView<EServiceDetailsController> {
  const EServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(
        title: AppStrings.details.tr,
        showDefaultBackButton: true,
        actions: [
          CustomIcon.svg(AppIcons.heart),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingSpinner()
            : controller.eService.value == null
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            SizedBox(
                              height: 256,
                              child: PageView.builder(
                                controller: controller.pageController,
                                itemBuilder: (context, index) => CustomImage(
                                  image: controller.eService.value!.images[index].url,
                                  height: 256,
                                  width: double.infinity,
                                ),
                                itemCount: controller.eService.value!.images.length,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                                count: controller.eService.value!.images.length,
                              ),
                            ),
                          ],
                        ),
                        VerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: CustomText(Utils.localizedValue(context, controller.eService.value!.name))),
                              HorizontalSpace(8),
                              Container(
                                decoration: BoxDecoration(
                                  color: controller.eService.value!.salon.closed
                                      ? AppColors.grey100
                                      : AppColors.primary.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                child: CustomText(
                                  controller.eService.value!.salon.closed ? AppStrings.closed.tr : AppStrings.open.tr,
                                  color: controller.eService.value!.salon.closed ? AppColors.black : AppColors.primary,
                                  fontSize: 12,
                                  height: 1.7,
                                ),
                              )
                            ],
                          ),
                        ),
                        VerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText(
                            controller.eService.value!.categories
                                .map((category) => Utils.localizedValue(context, category.name))
                                .toList()
                                .join(" - "),
                            color: AppColors.grey,
                          ),
                        ),
                        VerticalSpace(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomIcon(Icons.access_time, size: 16),
                                  HorizontalSpace(4),
                                  CustomText(controller.eService.value!.duration, fontSize: 10),
                                ],
                              ),
                              PriceWidget(myPrice: controller.eService.value!.price.toDouble()),
                            ],
                          ),
                        ),
                        controller.eService.value!.optionGroups.isNotEmpty
                            ? Column(
                                children: [
                                  VerticalSpace(16),
                                  Divider(height: 1, thickness: 5, color: AppColors.grey100),
                                  VerticalSpace(8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: CustomText("Options".tr),
                                  ),
                                  VerticalSpace(8),
                                  Builder(
                                    builder: (context) {
                                      final List<Option> options = [
                                        for (var optionGroup in controller.eService.value!.optionGroups)
                                          ...optionGroup.options
                                      ];
                                      return SizedBox(
                                        height: 112,
                                        child: ListView.separated(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) => Container(
                                            width: 75,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              // border: index == 0 ? Border.all(color: AppColors.primary) : null,
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: CustomImage(image: options[index].image.url, borderRadius: 8),
                                                ),
                                                VerticalSpace(4),
                                                CustomText(options[index].name, fontSize: 12),
                                                VerticalSpace(4),
                                                PriceWidget(myPrice: options[index].price.toDouble()),
                                              ],
                                            ),
                                          ),
                                          separatorBuilder: (context, index) => SizedBox(width: 16),
                                          itemCount: options.length,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : SizedBox(),
                        VerticalSpace(16),
                        Divider(height: 1, thickness: 3, color: AppColors.grey100),
                        VerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText("Description".tr),
                        ),
                        VerticalSpace(12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText(Utils.localizedValue(context, controller.eService.value!.description)),
                        ),
                        VerticalSpace(8),
                        Divider(height: 1, thickness: 3, color: AppColors.grey100),
                        VerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              CustomImage(
                                image: controller.eService.value!.salon.images.isEmpty
                                    ? ""
                                    : controller.eService.value!.salon.images[0].url,
                                width: 45,
                                height: 45,
                                borderRadius: 8,
                              ),
                              HorizontalSpace(8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(Utils.localizedValue(context, controller.eService.value!.salon.name), autoSized: true, maxLines: 1),
                                  ],
                                ),
                              ),
                              // CustomText("(${_eService.salon.reviews.length})", height: 0, color: AppColors.grey),
                              RatingBarIndicator(
                                rating: controller.eService.value!.salon.rate.toDouble() ?? 0,
                                itemCount: 5,
                                itemSize: 20,
                                unratedColor: AppColors.gray200,
                                itemPadding: EdgeInsets.zero,
                                itemBuilder: (context, index) =>
                                    const CustomIcon(Icons.star_rounded, color: AppColors.ratingStar),
                              ),
                              HorizontalSpace(4),
                              CustomText("${controller.eService.value!.salon.rate}", height: 0),
                            ],
                          ),
                        ),
                        VerticalSpace(8),
                        Divider(height: 1, thickness: 3, color: AppColors.grey100),
                        VerticalSpace(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomText(AppStrings.gallery.tr),
                        ),
                        VerticalSpace(8),
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CustomImage(
                              image: controller.eService.value!.images[index].url,
                              height: 100,
                              width: 100,
                              borderRadius: 8,
                            ),
                            separatorBuilder: (context, index) => HorizontalSpace(8),
                            itemCount: controller.eService.value!.images.length,
                          ),
                        ),
                        VerticalSpace(14),
                        Divider(height: 1, thickness: 3, color: AppColors.grey100),
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: CustomButton(
                            text:
                                "${AppStrings.bookServiceBy.tr} ${controller.eService.value!.price} ${configs.value!.defaultCurrency}",
                            onPressed: () {
                              Get.toNamed(
                                Routes.bookServiceScreen,
                                // arguments: {'booking': controller.booking.value},
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
