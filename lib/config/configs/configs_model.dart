import '../../core/utils/json_utils.dart';

class ConfigsModel {
  final String appName;
  final bool enableStripe;
  final String defaultTax;
  final String defaultCurrency;
  final String fcmKey;
  final bool enablePaypal;
  final String defaultTheme;
  final String mainColor;
  final String mainDarkColor;
  final String secondColor;
  final String secondDarkColor;
  final String accentColor;
  final String accentDarkColor;
  final String scaffoldDarkColor;
  final String scaffoldColor;
  final String googleMapsKey;
  final String mobileLanguage;
  final String defaultCountryCode;
  final String appVersion;
  final bool enableVersion;
  final bool currencyRight;
  final int defaultCurrencyDecimalDigits;
  final bool enableRazorpay;
  final String distanceUnit;
  final String homeSection1;
  final String homeSection2;
  final String homeSection3;
  final String homeSection4;
  final String homeSection5;
  final String homeSection6;
  final String homeSection7;
  final String homeSection8;
  final String homeSection9;
  final String homeSection10;
  final String homeSection11;
  final String homeSection12;
  final List modules;

  ConfigsModel({
    required this.appName,
    required this.enableStripe,
    required this.defaultTax,
    required this.defaultCurrency,
    required this.fcmKey,
    required this.enablePaypal,
    required this.defaultTheme,
    required this.mainColor,
    required this.mainDarkColor,
    required this.secondColor,
    required this.secondDarkColor,
    required this.accentColor,
    required this.accentDarkColor,
    required this.scaffoldDarkColor,
    required this.scaffoldColor,
    required this.googleMapsKey,
    required this.mobileLanguage,
    required this.defaultCountryCode,
    required this.appVersion,
    required this.enableVersion,
    required this.currencyRight,
    required this.defaultCurrencyDecimalDigits,
    required this.enableRazorpay,
    required this.distanceUnit,
    required this.homeSection1,
    required this.homeSection2,
    required this.homeSection3,
    required this.homeSection4,
    required this.homeSection5,
    required this.homeSection6,
    required this.homeSection7,
    required this.homeSection8,
    required this.homeSection9,
    required this.homeSection10,
    required this.homeSection11,
    required this.homeSection12,
    required this.modules,
  });

  factory ConfigsModel.fromJson(Map<String, dynamic> json) => ConfigsModel(
        appName: JsonUtils.parseStringFromJson(json['app_name']),
        enableStripe: JsonUtils.parseBoolFromJson(json['enable_stripe']),
        defaultTax: JsonUtils.parseStringFromJson(json['default_tax']),
        defaultCurrency: JsonUtils.parseStringFromJson(json['default_currency']),
        fcmKey: JsonUtils.parseStringFromJson(json['fcm_key']),
        enablePaypal: JsonUtils.parseBoolFromJson(json['enable_paypal']),
        defaultTheme: JsonUtils.parseStringFromJson(json['default_theme']),
        mainColor: JsonUtils.parseStringFromJson(json['main_color']),
        mainDarkColor: JsonUtils.parseStringFromJson(json['main_dark_color']),
        secondColor: JsonUtils.parseStringFromJson(json['second_color']),
        secondDarkColor: JsonUtils.parseStringFromJson(json['second_dark_color']),
        accentColor: JsonUtils.parseStringFromJson(json['accent_color']),
        accentDarkColor: JsonUtils.parseStringFromJson(json['accent_dark_color']),
        scaffoldDarkColor: JsonUtils.parseStringFromJson(json['scaffold_dark_color']),
        scaffoldColor: JsonUtils.parseStringFromJson(json['scaffold_color']),
        googleMapsKey: JsonUtils.parseStringFromJson(json['google_maps_key']),
        mobileLanguage: JsonUtils.parseStringFromJson(json['mobile_language']),
        defaultCountryCode: JsonUtils.parseStringFromJson(json['default_country_code']),
        appVersion: JsonUtils.parseStringFromJson(json['app_version']),
        enableVersion: JsonUtils.parseBoolFromJson(json['enable_version']),
        currencyRight: JsonUtils.parseBoolFromJson(json['currency_right']),
        defaultCurrencyDecimalDigits: JsonUtils.parseIntFromJson(json['default_currency_decimal_digits']),
        enableRazorpay: JsonUtils.parseBoolFromJson(json['enable_razorpay']),
        distanceUnit: JsonUtils.parseStringFromJson(json['distance_unit']),
        homeSection1: JsonUtils.parseStringFromJson(json['home_section1']),
        homeSection2: JsonUtils.parseStringFromJson(json['home_section2']),
        homeSection3: JsonUtils.parseStringFromJson(json['home_section3']),
        homeSection4: JsonUtils.parseStringFromJson(json['home_section4']),
        homeSection5: JsonUtils.parseStringFromJson(json['home_section5']),
        homeSection6: JsonUtils.parseStringFromJson(json['home_section6']),
        homeSection7: JsonUtils.parseStringFromJson(json['home_section7']),
        homeSection8: JsonUtils.parseStringFromJson(json['home_section8']),
        homeSection9: JsonUtils.parseStringFromJson(json['home_section9']),
        homeSection10: JsonUtils.parseStringFromJson(json['home_section10']),
        homeSection11: JsonUtils.parseStringFromJson(json['home_section11']),
        homeSection12: JsonUtils.parseStringFromJson(json['home_section12']),
        modules: json['modules'] != null
            ? List.from(json['modules'].map((module) => JsonUtils.parseStringFromJson(module)))
            : [],
      );
}
