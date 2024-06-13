import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ar.dart';
import 'en.dart';

class L10n extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"ar": arabic, "en": english};

  static final List<Locale> supportedLocales = [
    const Locale("en", ""),
    const Locale("ar", ""),
  ];

  static const List<LocalizationsDelegate> localizationDelegates = [
    CountryLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static bool isAr(BuildContext context) => Localizations.localeOf(context).languageCode == 'ar';
}
