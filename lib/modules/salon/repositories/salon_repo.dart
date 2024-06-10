import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class SalonRepo extends BaseRepository {
  final ApiClient _apiClient;

  SalonRepo(this._apiClient, super.networkInfo);
}
