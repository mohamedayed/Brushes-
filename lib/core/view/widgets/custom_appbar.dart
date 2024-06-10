import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool showDefaultBackButton;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? bgColor;
  final Widget? flexibleSpace;
  final bool isDarkStatusBar;
  final double elevation;
  final double? leadingWidth;
  final double? titleSpacing;
  final double? toolbarHeight;

  const CustomAppbar({
    this.leading,
    this.showDefaultBackButton = true,
    this.title,
    this.actions,
    this.bottom,
    this.bgColor,
    this.flexibleSpace,
    this.titleSpacing,
    this.leadingWidth,
    this.toolbarHeight,
    this.centerTitle = true,
    this.isDarkStatusBar = true,
    this.elevation = AppSize.s0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      leading: showDefaultBackButton ? const Center(child: DefaultBackButton()) : leading,
      title: title,
      automaticallyImplyLeading: showDefaultBackButton,
      actions: actions != null
          ? [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: AppPadding.p16),
                child: Center(child: Row(children: actions!)),
              ),
            ]
          : null,
      backgroundColor: bgColor,
      titleSpacing: titleSpacing,
      elevation: elevation,
      centerTitle: centerTitle,
      flexibleSpace: flexibleSpace,
      toolbarHeight: toolbarHeight,
      bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: isDarkStatusBar ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDarkStatusBar ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
