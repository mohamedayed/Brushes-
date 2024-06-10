import 'package:brushes/core/resources/app_values.dart';
import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/modules/home/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';
import '../widgets/slide_item_widget.dart';

class HomeSlider extends GetWidget<HomeController> {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.sliders.isEmpty
            ? const SizedBox.shrink()
            : Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: controller.sliders.length,
                    itemBuilder: (context, index, pageIndex) => SlideItemWidget(slide: controller.sliders[index]),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Time.t5s,
                      height: 172,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) => controller.currentSlide.value = index,
                    ),
                  ),
                  const VerticalSpace(AppSize.s10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p4, horizontal: AppPadding.p6),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.gray300),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        controller.sliders.length,
                        (index) => Container(
                          width: AppSize.s6,
                          height: AppSize.s6,
                          margin: index != controller.sliders.length - 1
                              ? const EdgeInsetsDirectional.only(end: AppPadding.p4)
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(AppPadding.p10)),
                            color: controller.currentSlide.value == index
                                ? controller.sliders[index].indicatorColor
                                : controller.sliders[index].indicatorColor.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
