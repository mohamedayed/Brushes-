import 'package:brushes/core/view/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/resources.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? description;
  final Color labelColor;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final bool obscureText;
  final bool? enabled;
  final bool? isDense;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final AutovalidateMode? autoValidateMode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? prefixSuffixPadding;

  const CustomTextField({
    this.hintText,
    this.label,
    this.description,
    this.labelColor = AppColors.black,
    this.prefix,
    this.suffix,
    this.textCapitalization,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.keyBoardType,
    this.controller,
    this.enabled,
    this.isDense = true,
    this.formatters,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.onSubmitted,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.initialValue,
    this.autoValidateMode,
    this.contentPadding,
    this.prefixSuffixPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) CustomText(label!, fontSize: FontSize.s12),
        if (label != null) const VerticalSpace(AppSize.s10),
        TextFormField(
          autovalidateMode: autoValidateMode,
          cursorColor: AppColors.primary,
          cursorHeight: AppSize.s16,
          textCapitalization: textCapitalization ?? TextCapitalization.sentences,
          obscureText: obscureText,
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          inputFormatters: formatters,
          onChanged: onChanged,
          onTap: onTap,
          onSaved: onSaved,
          maxLength: maxLength,
          onFieldSubmitted: onSubmitted,
          initialValue: initialValue,
          keyboardType: keyBoardType,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          enabled: enabled,
          textInputAction: textInputAction,
          style: const TextStyle(
            color: AppColors.black,
            // fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
            fontFamily: FontConstants.englishFontFamily,
            fontSize: FontSize.s12,
            fontWeight: FontWeightManager.regular,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColors.white,
            contentPadding: contentPadding,
            isDense: isDense,
            prefixIcon: prefix != null
                ? Padding(
                    padding: prefixSuffixPadding ??
                        const EdgeInsetsDirectional.only(start: AppPadding.p12, end: AppPadding.p8),
                    child: prefix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
            suffixIcon: suffix != null
                ? Padding(
                    padding: prefixSuffixPadding ??
                        const EdgeInsetsDirectional.only(start: AppPadding.p12, end: AppPadding.p8),
                    child: suffix,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
          ),
        ),
      ],
    );
  }
}
