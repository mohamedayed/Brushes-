import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/resources.dart';

class RatingStar extends StatelessWidget {
  final Color color;
  final double iconSize;

  const RatingStar({this.color = AppColors.gray200, this.iconSize = 20, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(iconSize / 2.5),
      decoration: ShapeDecoration(shape: const CircleBorder(), color: color),
      child: SvgPicture.asset(AppIcons.star, width: iconSize, height: iconSize, color: AppColors.white),
    );
  }
}
