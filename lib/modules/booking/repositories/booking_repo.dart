import 'package:brushes/core/services/network/endpoints.dart';
import 'package:brushes/modules/booking/models/requests/booking_body.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../models/responses/booking_model.dart';

class BookingRepo extends BaseRepository {
  final ApiClient _apiClient;

  BookingRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, Booking>> createBooking(BookingBody bookingBody) async {
    return super.call<Booking>(
      httpRequest: () => _apiClient.post(url: EndPoints.bookings, requestBody: bookingBody.toJson()),
      successReturn: (data) => Booking.fromJson(data),
    );
  }
}
