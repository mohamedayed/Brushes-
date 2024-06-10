import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/services/local/cache_client.dart';
import 'package:brushes/core/services/local/storage_keys.dart';
import 'package:brushes/core/services/location/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../modules/addresses/models/responses/address_model.dart';

class AddressService {
  final CacheClient _cacheClient;

  AddressService(this._cacheClient);

  static Rx<Address?> currentAddress = Rx(null);

  void setCurrentAddress({Address? address}) async {
    if (address != null) {
      await _cacheClient.save(StorageKeys.currentAddress, address.toJson());
      currentAddress(address);
      return;
    }

    final storedAddress = _cacheClient.get(StorageKeys.currentAddress);
    await Future.delayed(Time.t300ms);
    if (storedAddress != null) {
      currentAddress(Address.fromJson(storedAddress));
    } else {
      final bool isLocationEnabled = await LocationService.isLocationServiceEnabled();
      if (!isLocationEnabled) return;

      final bool hasPermission = await LocationService.hasPermission();
      if (!hasPermission) return;

      final Position position = await LocationService.getCurrentLocation();
      final String stringAddress = await LocationService.getAddress(position.latitude, position.longitude);
      final Address address = Address.fromJson({
        'address': stringAddress,
        'latitude': position.latitude,
        'longitude': position.longitude,
      });

      currentAddress(address);
    }
  }

  void onCurrentAddressChanged(void Function(Address?) onChanged) {
    currentAddress.listen((newAddress) {
      onChanged(currentAddress.value);
    });
  }
}
