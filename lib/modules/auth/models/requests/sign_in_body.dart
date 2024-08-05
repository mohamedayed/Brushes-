import '../../../../core/services/notifications/notification_fcm.dart';

class SignInBody {
  String? email;
  String? password;

  void copyWith({
    String? email,
    String? password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      "device_token": await NotificationsFCM.fcmToken,
    };
  }
}
