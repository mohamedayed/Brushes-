import 'package:brushes/core/resources/app_values.dart';
import 'package:brushes/core/utils/ui_utils.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/home/models/responses/home_slider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/resources/resources.dart';

class SlideItemWidget extends StatelessWidget {
  final HomeSliderModel slide;

  const SlideItemWidget({required this.slide, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomImage(
          image: slide.image.url,
          width: double.infinity,
          fit: UIUtils.getBoxFit(slide.imageFit),
          height: 172,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: slide.button.en.isNotEmpty && slide.button.ar.isNotEmpty ? AppPadding.p8 : AppPadding.p14,
          ),
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(Utils.localizedValue(context, slide.text), color: slide.textColor, maxLines: 3),
              ),
              const HorizontalSpace(4),
              if (slide.button.en.isNotEmpty && slide.button.ar.isNotEmpty)
                CustomButton(
                  height: AppSize.s36,
                  text: Utils.localizedValue(context, slide.button),
                  color: AppColors.warning.withOpacity(0.5),
                  onPressed: () {
                    if (slide.salonId != null) {
                      Get.toNamed(Routes.salonDetailsScreen, arguments: {'id': slide.salonId});
                    } else if (slide.eServiceId != null) {
                      Get.toNamed(Routes.eServiceDetailsScreen, arguments: {'id': slide.eServiceId});
                    }
                  },
                ),
            ],
          ),
        )
      ],
    );
  }
}
