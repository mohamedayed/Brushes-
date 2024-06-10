import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class ProductsRepo extends BaseRepository {
  final ApiClient _apiClient;

  ProductsRepo(this._apiClient, super.networkInfo);
}
