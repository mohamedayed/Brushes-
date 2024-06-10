import '../../../../core/utils/json_utils.dart';

class Address {
  final int id;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final bool isDefault;
  final String userId;

  Address({
    required this.id,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isDefault,
    required this.userId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: JsonUtils.parseIntFromJson(json['id']),
        description: JsonUtils.parseStringFromJson(json['description']),
        address: JsonUtils.parseStringFromJson(json['address']),
        latitude: JsonUtils.parseDoubleFromJson(json['latitude']),
        longitude: JsonUtils.parseDoubleFromJson(json['longitude']),
        isDefault: JsonUtils.parseBoolFromJson(json['default']),
        userId: JsonUtils.parseStringFromJson(json['user_id']),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'default': isDefault,
      'user_id': userId,
    };
  }
}
