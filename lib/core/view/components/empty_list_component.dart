import 'package:brushes/core/view/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomEmptyListPageWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;

  const CustomEmptyListPageWidget({
    required this.image,
    required this.title,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(40),
        CustomImage(image: image, fit: BoxFit.contain),
        Center(
          child: CustomText(
            title,
            textAlign: TextAlign.center,
            fontSize: FontSize.s16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subtitle != null) const VerticalSpace(20),
        if (subtitle != null)
          Center(
            child: CustomText(subtitle!, fontWeight: FontWeight.bold, color: AppColors.grey),
          ),
      ],
    );
  }
}

class CustomEmptyListSmallWidget extends StatelessWidget {
  final String title;
  final String image;

  const CustomEmptyListSmallWidget({
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Expanded(child: CustomImage(image: image, fit: BoxFit.contain)),
          Center(
            child: CustomText(
              title,
              textAlign: TextAlign.center,
              fontSize: FontSize.s16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
