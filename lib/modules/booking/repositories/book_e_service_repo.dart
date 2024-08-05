import '../models/requests/validate_coupon_body.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../models/responses/coupon.dart';

class BookEServiceRepo extends BaseRepository {
  final ApiClient _apiClient;

  BookEServiceRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<List<dynamic>>>> getAvailabilityHours(
    int salonId,
    DateTime date, {
    int? employeeId,
  }) async {
    return super.call<List<List<dynamic>>>(
      httpRequest: () => _apiClient.get(
        url: '${EndPoints.availabilityHours}/$salonId',
        queryParameters: {
          'date': DateFormat('y-MM-dd').format(date),
          if (employeeId != null) 'employee_id': employeeId,
        },
      ),
      successReturn: (data) => List<List<dynamic>>.from(data),
    );
  }

  Future<Either<Failure, Coupon?>> validateCoupon(ValidateCouponBody validateCouponBody) async {
    return super.call<Coupon?>(
      httpRequest: () => _apiClient.get(url: EndPoints.coupons, queryParameters: validateCouponBody.toJson()),
      successReturn: (data) => data == null ? null : Coupon.fromJson(data),
    );
  }
}
