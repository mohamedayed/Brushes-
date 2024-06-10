import 'package:flutter/material.dart';

import '../views.dart';
import '../../resources/resources.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showDefaultBackButton;
  final Color? bgColor;
  final List<Widget>? actions;

  const MainAppbar({required this.title, this.bgColor, this.showDefaultBackButton = true, this.actions, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      showDefaultBackButton: showDefaultBackButton,
      actions: actions,
      bgColor: bgColor,
      titleSpacing: AppSize.s0,
      title: CustomText(
        title,
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.bold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
