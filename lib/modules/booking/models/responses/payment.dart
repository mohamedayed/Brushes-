import '../../../../core/utils/json_utils.dart';
import 'payment_method_model.dart';
import 'payment_status.dart';

class Payment {
  final int id;
  final String description;
  final num amount;
  final PaymentMethod paymentMethod;
  final PaymentStatus paymentStatus;

  Payment({
    required this.id,
    required this.description,
    required this.amount,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: JsonUtils.parseIntFromJson(json['id']),
        description: JsonUtils.parseStringFromJson(json['description']),
        amount: JsonUtils.parseNumFromJson(json['amount']),
        paymentMethod: PaymentMethod.fromJson(json['payment_method'] ?? {}),
        paymentStatus: PaymentStatus.fromJson(json['payment_status'] ?? {}),
      );
}
