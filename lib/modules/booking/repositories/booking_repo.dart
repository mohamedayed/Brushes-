import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class BookingRepo extends BaseRepository {
  final ApiClient _apiClient;

  BookingRepo(this._apiClient, super.networkInfo);
}
