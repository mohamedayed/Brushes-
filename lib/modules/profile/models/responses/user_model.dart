import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final Media avatar;
  final String apiToken;
  final String deviceToken;
  final String phoneNumber;
  final bool verifiedPhone;
  final String verificationId;
  final String address;
  final String bio;
  final bool auth;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.apiToken,
    required this.deviceToken,
    required this.phoneNumber,
    required this.verifiedPhone,
    required this.verificationId,
    required this.address,
    required this.bio,
    required this.avatar,
    required this.auth,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        email: JsonUtils.parseStringFromJson(json['email']),
        apiToken: JsonUtils.parseStringFromJson(json['api_token']),
        deviceToken: JsonUtils.parseStringFromJson(json['device_token']),
        phoneNumber: JsonUtils.parseStringFromJson(json['phone_number']),
        verifiedPhone: JsonUtils.parseBoolFromJson(json['phone_verified_at']),
        verificationId: JsonUtils.parseStringFromJson(json['verification_id']),
        address: json['custom_fields']?['address']?['view'] ?? JsonUtils.parseStringFromJson(json['address']),
        bio: json['custom_fields']?['bio']?['view'] ?? JsonUtils.parseStringFromJson(json['bio']),
        avatar: Media.fromJson(json['avatar'] ?? {}),
        auth: JsonUtils.parseBoolFromJson(json['auth']),
        role: JsonUtils.parseStringFromJson(json["user_role"]),
      );
}
