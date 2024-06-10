import 'package:get/get.dart';

import '../repositories/addresses_repo.dart';

class AddressesController extends GetxController {
  final AddressesRepo _addressesRepo;

  AddressesController(this._addressesRepo);
}
