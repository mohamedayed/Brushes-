import 'package:get/get.dart';

import '../../../core/services/address/address_service.dart';
import '../../../core/utils/alerts.dart';
import '../models/responses/address_model.dart';
import '../repositories/addresses_repo.dart';

class AddressesController extends GetxController {
  final AddressesRepo _addressesRepo;
  final AddressService _addressService;

  AddressesController(this._addressesRepo, this._addressService);

  @override
  void onInit() {
    super.onInit();
    getAddresses();
    fromBookingScreen = Get.arguments["from_booking_screen"];
  }

  RxBool isAdding = false.obs;
  RxBool isLoading = false.obs;
  RxList<Address> addresses = RxList<Address>([]);
  late final bool fromBookingScreen;

  void setCurrentAddress(Address address) {
    _addressService.setCurrentAddress(address: address);
    Get.back();
  }

  Future<void> getAddresses() async {
    isLoading(true);
    final result = await _addressesRepo.getAddresses();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getAddresses),
      (addresses) => this.addresses(addresses),
    );
    isLoading(false);
  }

  Future<void> addAddress(Address address) async {
    isAdding(true);
    final result = await _addressesRepo.addAddress(address);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: () => addAddress(address)),
      (address) {
        addresses.add(address);
        addresses.refresh();
      },
    );
    isAdding(false);
  }
}
