import 'package:brushes/core/services/network/endpoints.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../booking/models/responses/payment_method_model.dart';

class CheckoutRepo extends BaseRepository {
  final ApiClient _apiClient;

  CheckoutRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, List<PaymentMethod>>> getPaymentMethods() async {
    return super.call<List<PaymentMethod>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.paymentMethods,
        queryParameters: {
          'with': 'media',
          'search': 'enabled:1',
          'searchFields': 'enabled:=',
          'orderBy': 'order',
          'sortBy': 'asc'
        },
      ),
      successReturn: (data) =>
          List<PaymentMethod>.from(data.map((paymentMethod) => PaymentMethod.fromJson(paymentMethod))),
    );
  }
}
