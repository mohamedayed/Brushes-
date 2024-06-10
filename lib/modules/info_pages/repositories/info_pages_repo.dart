import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class InfoPagesRepo extends BaseRepository {
  final ApiClient _apiClient;

  InfoPagesRepo(this._apiClient, super.networkInfo);
}
