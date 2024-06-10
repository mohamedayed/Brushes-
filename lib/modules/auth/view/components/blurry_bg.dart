import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class BlurryBG extends StatelessWidget {
  const BlurryBG({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomImage(image: AppImages.signInRedBg),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomImage(image: AppImages.signInBlurryBg),
          ),
        ),
      ],
    );
  }
}
