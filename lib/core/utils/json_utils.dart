import 'dart:ui';

import '../extensions/color_extension.dart';
import '../resources/resources.dart';
import 'package:intl/intl.dart';

import '../base/models/media_model.dart';

class JsonUtils {
  static DateTime parseDatetimeFromJson(dynamic value) => DateTime.tryParse(value.toString()) ?? DateTime(1970);

  static num parseNumFromJson(dynamic value) => num.tryParse(value.toString()) ?? 0.0;

  static double parseDoubleFromJson(dynamic value) => double.tryParse(value.toString()) ?? 0.0;

  static int parseIntFromJson(dynamic value, {int defaultValue = 0}) => int.tryParse(value.toString()) ?? defaultValue;

  static String parseStringFromJson(dynamic value) => value?.toString() ?? "";

  static String parseDurationFromJson(dynamic value) {
    DateTime dateTime = DateTime(0).add(Duration(minutes: int.tryParse(value.toString()) ?? 0));
    String formatted = DateFormat("${dateTime.hour == 0 ? "" : "HH'h' "}mm'm'").format(dateTime);
    return formatted;
  }

  static bool parseBoolFromJson(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    return value != null && (value.toString().toLowerCase() == 'true' || value == 1);
  }

  static bool parseListromJson(dynamic value) {
    return value != null && (value.toString().toLowerCase() == 'true' || value == 1);
  }

  static Color parseColorFromJson(dynamic value) {
    if (value == null) return AppColors.black;
    return HexColor.fromHex(value.toString());
  }

  static Media mediaFromJson(dynamic value) {
    if (value == null) return Media.fromJson({});
    if (value is! List) return Media.fromJson({});
    return Media.fromJson(value[0]);
  }
}
