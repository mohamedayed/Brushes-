import '../../../core/services/network/endpoints.dart';
import '../models/responses/salon_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../e_service/models/responses/e_service_model.dart';

class SalonRepo extends BaseRepository {
  final ApiClient _apiClient;

  SalonRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, Salon>> getSalon(int id) async {
    return super.call<Salon>(
      httpRequest: () => _apiClient.get(
        url: '${EndPoints.getSalons}/$id',
        queryParameters: {'with': 'salonLevel;availabilityHours;users;taxes;address'},
      ),
      successReturn: (data) => Salon.fromJson(data),
    );
  }

  Future<Either<Failure, List<EService>>> getSalonEServices(int salonId, List<int> categoriesIds) async {
    return super.call<List<EService>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.eServices,
        queryParameters: {
          'with': 'categories;optionGroups;optionGroups.options;optionGroups.options.media',
          'search': 'categories.id:${categoriesIds[0] == 0 ? "" : categoriesIds.join(',')};salon_id:$salonId',
          'searchFields': 'categories.id:in;salon_id:=',
          'searchJoin': 'and',
          // 'limit': '4',
          // 'offset': ((page - 1) * 4).toString()
        },
      ),
      successReturn: (data) => List<EService>.from(data.map((eService) => EService.fromJson(eService))),
    );
  }
}
