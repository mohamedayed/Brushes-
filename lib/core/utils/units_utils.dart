import '../resources/resources.dart';
import 'globals.dart';
import 'package:get/get.dart';

class UnitsUtils {
  static String getDistance(double? distance) {
    final String unit = configs.value!.distanceUnit;
    if (unit == 'km' && distance != null) distance *= 1.60934;
    return distance != null ? "${AppStrings.awayFromYou.tr} ${distance.toStringAsFixed(2)} ${unit.tr}" : "";
  }
}
