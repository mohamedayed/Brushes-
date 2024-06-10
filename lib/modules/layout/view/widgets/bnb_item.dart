import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BNBItem extends BottomNavigationBarItem {
  final String title;
  final String sign;
  final String activeSign;
  final BuildContext context;

  BNBItem(this.context, {required this.title, required this.sign, required this.activeSign, Key? key})
      : super(
          icon: SvgPicture.asset(sign, width: 20, height: 20),
          label: title,
          activeIcon: CustomIcon.svg(activeSign, size: AppSize.s20, color: AppColors.warning),
        );
}
