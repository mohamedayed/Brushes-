import '../../../core/utils/globals.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/responses/address_model.dart';

class AddressesRepo extends BaseRepository {
  final ApiClient _apiClient;

  AddressesRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, Address>> addAddress(Address address) async {
    return super.call<Address>(
      httpRequest: () => _apiClient.post(url: EndPoints.addresses, requestBody: address.toJson()),
      successReturn: (data) => Address.fromJson(data),
    );
  }

  Future<Either<Failure, List<Address>>> getAddresses() async {
    return super.call<List<Address>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.addresses,
        queryParameters: {
          'search': "user_id:${currentUser.value!.id}",
          'searchFields': 'user_id:=',
          'orderBy': 'id',
          'sortedBy': 'desc',
        },
      ),
      successReturn: (data) => List<Address>.from(data.map((address) => Address.fromJson(address))),
    );
  }
}
