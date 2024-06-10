import '../../../../core/utils/json_utils.dart';
import '../../../booking/models/responses/booking_model.dart';

class Review {
  final int id;
  final num rate;
  final String review;
  final DateTime createdAt;
  final Booking booking;

  Review({
    required this.id,
    required this.rate,
    required this.review,
    required this.createdAt,
    required this.booking,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: JsonUtils.parseIntFromJson(json['id']),
        rate: JsonUtils.parseNumFromJson(json['rate']),
        review: JsonUtils.parseStringFromJson(json['review']),
        createdAt: JsonUtils.parseDatetimeFromJson(json['created_at']),
        booking: Booking.fromJson(json['booking'] ?? {}),
      );
}
