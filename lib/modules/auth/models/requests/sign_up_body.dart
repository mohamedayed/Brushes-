import '../../../../core/services/notifications/notification_fcm.dart';

class SignUpBody {
  String? name;
  String? email;
  String? password;
  String? countryCode;
  String? phoneNumber;

  SignUpBody({
    this.name,
    this.email,
    this.password,
    this.countryCode,
    this.phoneNumber,
  });

  void copyWith({
    String? name,
    String? email,
    String? password,
    String? countryCode,
    String? phoneNumber,
  }) {
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.countryCode = countryCode ?? this.countryCode;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (phoneNumber != null) 'phone_number': "+$countryCode $phoneNumber",
      "device_token": await NotificationsFCM.fcmToken,
    };
  }
}
