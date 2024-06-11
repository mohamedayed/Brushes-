import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/responses/category_model.dart';

class CategoriesRepo extends BaseRepository {
  final ApiClient _apiClient;

  CategoriesRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<CategoryModel>>> getCategories({required parent}) async {
    return super.call<List<CategoryModel>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.getCategories,
        queryParameters: {if (parent) 'parent': 'true', 'orderBy': 'order', 'sortBy': 'asc'},
      ),
      successReturn: (data) => List<CategoryModel>.from(data.map((category) => CategoryModel.fromJson(category))),
    );
  }

  Future<Either<Failure, List<CategoryModel>>> getSalonCategories(int salonId) async {
    return super.call<List<CategoryModel>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.assignedCategories,
        queryParameters: {
          'parent': 'true',
          'orderBy': 'order',
          'salon_id': salonId,
          'sortBy': 'asc',
        },
      ),
      successReturn: (data) => List<CategoryModel>.from(data.map((category) => CategoryModel.fromJson(category))),
    );
  }
}
