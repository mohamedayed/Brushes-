import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../../categories/models/responses/category_model.dart';
import '../../salon/models/responses/salon_model.dart';
import '../models/responses/home_slider_model.dart';

class HomeRepo extends BaseRepository {
  final ApiClient _apiClient;

  HomeRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<HomeSliderModel>>> getHomeSliders() async {
    return super.call<List<HomeSliderModel>>(
      httpRequest: () => _apiClient.get(url: EndPoints.getHomeSliders),
      successReturn: (data) => List<HomeSliderModel>.from(data.map((slider) => HomeSliderModel.fromJson(slider))),
    );
  }

  Future<Either<Failure, List<Salon>>> getNearSalons(double myLat, double myLng, double areaLat, double areaLng) async {
    return super.call<List<Salon>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.getSalons,
        queryParameters: {
          'only': 'id;name;has_media;media;total_reviews;rate;salonLevel;address;distance;closed',
          'with': 'salonLevel;address',
          'limit': '6',
          'myLat': myLat,
          'myLon': myLng,
          'areaLat': areaLat,
          'areaLon': areaLng,
        },
      ),
      successReturn: (data) => List<Salon>.from(data.map((salon) => Salon.fromJson(salon))),
    );
  }

  Future<Either<Failure, List<CategoryModel>>> getFeaturedCategories() async {
    return super.call<List<CategoryModel>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.getCategories,
        queryParameters: {
          'with': 'featuredEServices',
          'parent': 'true',
          'search': 'featured:1',
          'searchFields': 'featured:=',
          'orderBy': 'order',
          'sortedBy': 'asc',
        },
      ),
      successReturn: (data) => List<CategoryModel>.from(data.map((category) => CategoryModel.fromJson(category))),
    );
  }
}
