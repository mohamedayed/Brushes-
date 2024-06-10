import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class ChatRepo extends BaseRepository {
  final ApiClient _apiClient;

  ChatRepo(this._apiClient, super.networkInfo);
}
