import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class AddressesRepo extends BaseRepository {
  final ApiClient _apiClient;

  AddressesRepo(this._apiClient, super.networkInfo);
}
