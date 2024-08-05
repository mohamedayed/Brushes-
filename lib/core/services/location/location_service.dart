import '../../resources/resources.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

import '../../utils/alerts.dart';

class LocationService {
  static Future<bool> isLocationServiceEnabled() async {
    bool isEnabled = await loc.Location.instance.serviceEnabled();
    if (isEnabled) {
      return true;
    } else {
      isEnabled = await loc.Location.instance.requestService();
      if (isEnabled) {
        return true;
      } else {
        Get.back();
        return false;
      }
    }
  }

  static Future<bool> hasPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        Get.back();
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      Get.back();
      await Geolocator.openAppSettings();
      return false;
    }
    return true;
  }

  static Future<Position> getCurrentLocation() async =>
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

  static Future<String> getAddress(double lat, double lng) async {
    try {
      setLocaleIdentifier(Get.locale!.languageCode);
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
      return "${placeMarks[0].country}, ${placeMarks[0].administrativeArea}, ${placeMarks[0].subAdministrativeArea}, ${placeMarks[0].street}";
    } on Exception catch (_) {
      Get.back();
      Alerts.showSnackBar(message: AppStrings.fetchAddressError.tr);
      return "";
    }
  }
}
