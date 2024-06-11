import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class OutlinedIconButton extends StatelessWidget {
  final dynamic icon;
  final Color color;
  final Color? iconColor;
  final Color? bgColor;
  final double? height;
  final double? width;
  final double size;
  final VoidCallback onTap;

  const OutlinedIconButton({
    required this.icon,
    required this.onTap,
    this.height,
    this.width,
    this.size = AppSize.s24,
    this.color = AppColors.gray200,
    this.iconColor,
    this.bgColor = AppColors.transparent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Center(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: color),
          ),
          child: icon is IconData
              ? CustomIcon(icon, size: size, color: iconColor)
              : CustomIcon.svg(icon, color: iconColor, size: size),
        ),
      ),
    );
  }
}
