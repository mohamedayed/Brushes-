import '../../../../core/utils/json_utils.dart';

class Coupon {
  final int id;
  final String code;
  final num discount;
  final String discountType;
  final num value;

  Coupon({
    required this.id,
    required this.code,
    required this.discount,
    required this.discountType,
    required this.value,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: JsonUtils.parseIntFromJson(json['id']),
        code: JsonUtils.parseStringFromJson(json['code']),
        discount: JsonUtils.parseNumFromJson(json['discount']),
        discountType: JsonUtils.parseStringFromJson(json['discount_type']),
        value: JsonUtils.parseNumFromJson(json['value']),
      );
}
