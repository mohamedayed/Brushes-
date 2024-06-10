import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? spinnerColor;
  final Widget? child;
  final double? height;
  final double? width;
  final double? textHeight;
  final double? borderRadius;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? buttonTextStyle;
  final bool isOutlined;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text = "",
    this.isLoading = false,
    this.spinnerColor,
    this.color,
    this.textColor,
    this.child,
    this.width,
    this.height,
    this.textHeight,
    this.borderRadius,
    this.buttonTextStyle,
    this.padding,
    this.margin,
    this.isOutlined = false,
    this.fontSize = FontSize.s14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            border: isOutlined ? Border.all(color: color ?? AppColors.gray250) : null,
            gradient: color == null && !isOutlined
                ? const LinearGradient(
                    colors: [AppColors.black, AppColors.gray900],
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  )
                : null,
            color: isOutlined
                ? null
                : onPressed == null
                    ? AppColors.grey
                    : color,
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s10),
          ),
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(borderRadius ?? AppSize.s10),
            child: Container(
              padding: height != null
                  ? const EdgeInsets.symmetric(horizontal: AppPadding.p16)
                  : padding ?? const EdgeInsets.symmetric(vertical: AppPadding.p12, horizontal: AppPadding.p10),
              child: isLoading
                  ? LoadingSpinner(hasSmallRadius: true, color: spinnerColor ?? AppColors.white)
                  : text.isNotEmpty
                      ? Center(
                          child: CustomText(
                            text,
                            textAlign: TextAlign.center,
                            color: onPressed == null ? AppColors.grey : textColor ?? AppColors.white,
                            fontWeight: FontWeightManager.bold,
                            fontSize: fontSize,
                            height: textHeight,
                          ),
                        )
                      : child,
            ),
          ),
        ),
      ),
    );
  }
}
