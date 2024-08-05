import '../../../config/localization/l10n/l10n.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/resources.dart';
import '../../utils/validators.dart';
import '../views.dart';

class PhoneNumberTextField extends StatefulWidget {
  final String? initialCountryCode;
  final String? initialPhoneNumber;
  final void Function(Country) onSelectCountry;
  final void Function(String)? onChanged;

  const PhoneNumberTextField({
    this.initialCountryCode,
    this.initialPhoneNumber,
    required this.onSelectCountry,
    this.onChanged,
    super.key,
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  late Country country;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    country = widget.initialCountryCode != null
        ? CountryParser.parsePhoneCode(widget.initialCountryCode!)
        : CountryParser.parsePhoneCode("20");
    widget.onSelectCountry(country);
    phoneController = TextEditingController(text: widget.initialPhoneNumber ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: AppStrings.phoneNumber.tr,
      hintText: "${AppStrings.example.tr}: ${country.example}",
      onChanged: widget.onChanged,
      validator: (value) => Validators.phoneNumberValidator(value!, country.example),
      keyBoardType: TextInputType.phone,
      controller: phoneController,
      prefix: const CustomIcon.svg(AppIcons.call),
      suffix: InkWell(
        onTap: () {
          showCountryPicker(
            context: context,
            countryListTheme: CountryListThemeData(
              textStyle: TextStyle(
                fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
                fontSize: FontSize.s12,
              ),
              searchTextStyle: TextStyle(
                fontFamily: L10n.isAr(context) ? FontConstants.arabicFontFamily : FontConstants.englishFontFamily,
                fontSize: FontSize.s12,
              ),
              borderRadius: BorderRadius.zero,
            ),
            onSelect: (value) {
              widget.onSelectCountry(value);
              setState(() => country = value);
            },
            showPhoneCode: true,
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: AppSize.s24, color: AppColors.black.withOpacity(0.5), width: AppSize.s1),
            const HorizontalSpace(AppSize.s4),
            const CustomIcon(Icons.keyboard_arrow_down_rounded, size: AppSize.s12),
            const HorizontalSpace(AppSize.s4),
            CustomText("+${country.phoneCode}"),
            const HorizontalSpace(AppSize.s4),
            CustomText(country.flagEmoji == "🇞🇛" ? "🇸🇦" : country.flagEmoji),
          ],
        ),
      ),
    );
  }
}
