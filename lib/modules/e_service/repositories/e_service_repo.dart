import '../../../core/base/models/pagination_model.dart';
import '../../../core/enums/category_filters.dart';
import '../../../core/utils/constants.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/responses/e_service_model.dart';

class EServiceRepo extends BaseRepository {
  final ApiClient _apiClient;

  EServiceRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, EService>> getEService(int id) async {
    return super.call<EService>(
      httpRequest: () => _apiClient.get(
        url: '${EndPoints.eServices}/$id',
        queryParameters: {'with': 'salon;salon.taxes;salon.users;salon.address;categories'},
      ),
      successReturn: (data) => EService.fromJson(data),
    );
  }

  Future<Either<Failure, PaginationModel<EService>>> getEServicesByCategory(
    int id,
    CategoryFilter categoryFilter, {
    int page = 1,
  }) async {
    return super.call<PaginationModel<EService>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.eServices,
        queryParameters: {
          ...categoryFilter.queryParameters(id),
          'limit': Constants.defaultPaginationLimit,
          'offset': ((page - 1) * Constants.defaultPaginationLimit).toString(),
        },
      ),
      successReturn: (data) => PaginationModel<EService>.fromJson(
        {},
        List<EService>.from(data.map((service) => EService.fromJson(service))),
      ),
    );
  }
}
