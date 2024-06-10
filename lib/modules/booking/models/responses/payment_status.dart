import '../../../../core/utils/json_utils.dart';

class PaymentStatus {
  final int id;
  final String status;
  final int order;

  // Constructor with required fields
  PaymentStatus({
    required this.id,
    required this.status,
    required this.order,
  });

  factory PaymentStatus.fromJson(Map<String, dynamic> json) => PaymentStatus(
        id: JsonUtils.parseIntFromJson(json['id']),
        status: JsonUtils.parseStringFromJson(json['status']),
        order: JsonUtils.parseIntFromJson(json['order']),
      );
}
