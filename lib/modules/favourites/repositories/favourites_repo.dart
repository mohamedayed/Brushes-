import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class FavouritesRepo extends BaseRepository {
  final ApiClient _apiClient;

  FavouritesRepo(this._apiClient, super.networkInfo);
}
