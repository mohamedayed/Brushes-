import 'package:brushes/core/services/network/endpoints.dart';
import 'package:brushes/modules/booking/models/requests/booking_body.dart';
import 'package:dartz/dartz.dart';

import '../../../core/base/models/pagination_model.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/utils/constants.dart';
import '../models/responses/booking_model.dart';
import '../models/responses/booking_status.dart';

class BookingRepo extends BaseRepository {
  final ApiClient _apiClient;

  BookingRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, Booking>> createBooking(BookingBody bookingBody) async {
    return super.call<Booking>(
      httpRequest: () => _apiClient.post(url: EndPoints.bookings, requestBody: bookingBody.toJson()),
      successReturn: (data) => Booking.fromJson(data),
    );
  }

  Future<Either<Failure, List<BookingStatus>>> getBookingStatuses() async {
    return super.call<List<BookingStatus>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.bookingStatuses,
        queryParameters: {'only': 'id;status;order', 'orderBy': 'order', 'sortedBy': 'asc'},
      ),
      successReturn: (data) => List<BookingStatus>.from(data.map((status) => BookingStatus.fromJson(status))),
    );
  }

  Future<Either<Failure, Booking>> getBooking(int id) async {
    return super.call<Booking>(
      httpRequest: () => _apiClient.get(
        url: "${EndPoints.bookings}/$id",
        queryParameters: {'with': 'bookingStatus;user;employee;payment;payment.paymentMethod;payment.paymentStatus'},
      ),
      successReturn: (data) => Booking.fromJson(data),
    );
  }

  Future<Either<Failure, PaginationModel<Booking>>> getBookings(int statusId, {int page = 1}) async {
    return super.call<PaginationModel<Booking>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.bookings,
        queryParameters: {
          'with': 'bookingStatus;payment;payment.paymentStatus;employee',
          'search': 'booking_status_id:$statusId',
          'orderBy': 'created_at',
          'sortedBy': 'desc',
          'limit': Constants.defaultPaginationLimit,
          'offset': ((page - 1) * Constants.defaultPaginationLimit).toString(),
        },
      ),
      successReturn: (data) => PaginationModel<Booking>.fromJson(
        {},
        List<Booking>.from(data.map((booking) => Booking.fromJson(booking))),
      ),
    );
  }
}
