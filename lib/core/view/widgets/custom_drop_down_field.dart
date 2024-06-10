import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final String? hintText;
  final String? label;
  final Color labelColor;
  final Color dropdownColor;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final void Function()? onTap;
  final String? Function(T?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final T? value;
  final TextInputType? keyBoardType;
  final AutovalidateMode? autoValidateMode;
  final double iconSize;
  final bool isLoadingValues;

  const CustomDropDownField({
    this.hintText,
    this.onChanged,
    this.label,
    this.labelColor = AppColors.black,
    this.onTap,
    this.items,
    this.prefix,
    this.suffix,
    this.validator,
    this.keyBoardType,
    this.value,
    this.autoValidateMode,
    this.iconSize = AppSize.s24,
    this.isLoadingValues = false,
    super.key,
    this.dropdownColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) CustomText(label!, color: labelColor),
        if (label != null) const VerticalSpace(AppSize.s6),
        DropdownButtonFormField<T>(
          items: isLoadingValues ? null : items,
          onChanged: onChanged,
          validator: validator,
          value: isLoadingValues ? null : value,
          onTap: onTap,
          icon: isLoadingValues
              ? const Padding(
                  padding: EdgeInsetsDirectional.only(end: AppPadding.p16),
                  child: SizedBox(
                    height: AppSize.s16,
                    width: AppSize.s16,
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: AppSize.s1_5,
                      backgroundColor: AppColors.black,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                  child: CustomIcon(Icons.keyboard_arrow_down_outlined),
                ),
          iconSize: iconSize,
          elevation: AppSize.s2.toInt(),
          hint: hintText != null
              ? CustomText(
                  hintText!,
                  color: AppColors.gray250,
                  height: 1,
                  fontWeight: FontWeightManager.regular,
                )
              : null,
          isDense: true,
          isExpanded: true,
          autovalidateMode: autoValidateMode,
          dropdownColor: dropdownColor,
          decoration: InputDecoration(
            hintText: hintText ?? "",
            hintStyle: TextStyle(
              color: AppColors.gray250,
              fontSize: FontSize.s14,
              height: 1,
              fontWeight: FontWeightManager.regular,
            ),
            prefixIcon: prefix != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(start: AppPadding.p12, end: AppPadding.p4),
                    child: prefix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
            suffixIcon: suffix != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(start: AppPadding.p12, end: AppPadding.p4),
                    child: suffix,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
            isDense: true,
            contentPadding: EdgeInsets.only(left: 14, top: 14, bottom: 14),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gray250, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gray250, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Get.theme.colorScheme.primary, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
