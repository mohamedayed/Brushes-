import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/local/cache_client.dart';
import '../../../core/services/local/storage_keys.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/network/endpoints.dart';
import '../../../core/services/notifications/notification_fcm.dart';
import '../../profile/models/responses/user_model.dart';

class SocialAuthRepo extends BaseRepository {
  final ApiClient _apiClient;
  final CacheClient _cacheClient;

  SocialAuthRepo(this._apiClient, this._cacheClient, super.networkInfo);

  Future<GoogleSignInAccount?> getGoogleAccount() async {
    final String clientId =
        Platform.isAndroid ? "" : "371753623141-2cn8g3uqvtsckl09adjk9ve539vgpi7g.apps.googleusercontent.com";
    await GoogleSignIn(clientId: clientId).signOut();
    GoogleSignInAccount? account = await GoogleSignIn(clientId: clientId).signIn();
    return account;
  }

  // Future<Map<String, dynamic>> getFacebookAccount() async {
  //   await FacebookAuth.instance.logOut();
  //   final loginResult = await FacebookAuth.instance.login(loginBehavior: LoginBehavior.nativeWithFallback);
  //   final Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
  //   return {...userData, "access_token": loginResult.accessToken?.token};
  // }

  Future<Either<Failure, UserModel>> googleSignIn(GoogleSignInAccount account) async {
    final auth = await account.authentication;
    return super.call<UserModel>(
      httpRequest: () async {
        final response = await _apiClient.post(
          url: EndPoints.socialSignIn,
          requestBody: {
            "provider_name": "google",
            "provider_id": account.id,
            "access_token": auth.accessToken,
            "name": account.displayName,
            "email": account.email,
            "image": account.photoUrl,
            "device_token": await NotificationsFCM.fcmToken,
          },
        );
        if (response.data["success"] != null && response.data["success"]) {
          await _cacheClient.save(StorageKeys.token, response.data["data"]["api_token"]);
          await _cacheClient.save(StorageKeys.isAuthed, true);
        }
        return response;
      },
      successReturn: (data) => UserModel.fromJson(data),
    );
  }

// Future<Either<Failure, UserModel>> facebookSignIn(Map<String, dynamic> userData,int type) async {
//   final String? fcmToken = await NotificationsFCM.getToken();
//   return super.call<UserModel>(
//     httpRequest: () async {
//       final response = await _apiClient.post(
//         url: EndPoints.socialLogin,
//         requestBody: {
//           "provider_name": "facebook",
//           "provider_id": userData["id"],
//           "access_token": userData["access_token"],
//           "name": userData["name"],
//           "email": userData["email"],
//           "image": userData["picture"]["data"]["url"],
//           "fcm": fcmToken,
//           "type":type
//         },
//       );
//       await _cacheClient.save(StorageKeys.token, response.data["data"]["token"]);
//       await _cacheClient.save(StorageKeys.isAuthed, true);
//       return response;
//     },
//     successReturn: (data) => UserModel.fromJson(data["user"]),
//   );
// }
}
