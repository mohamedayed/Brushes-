import '../../../core/services/network/endpoints.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../e_service/models/responses/e_service_model.dart';

class SearchRepo extends BaseRepository {
  final ApiClient _apiClient;

  SearchRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<EService>>> searchEServices(String keywords, List<int> categories) async {
    return super.call<List<EService>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.eServices,
        queryParameters: {
          'with': 'salon;salon.address;categories',
          'search': 'categories.id:${categories.join(',')};name:$keywords',
          'searchFields': 'categories.id:in;name:like',
          'searchJoin': 'and',
          // 'myLat' : "",
          // 'myLon' : "",
        },
      ),
      successReturn: (data) => List<EService>.from(data.map((service) => EService.fromJson(service))),
    );
  }
}
