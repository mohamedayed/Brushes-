import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../core/resources/resources.dart';
import '../../../core/services/error/error_handler.dart';
import '../../../core/services/error/failure.dart';
import '../../../core/services/local/cache_client.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/services/local/storage_keys.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../../profile/models/responses/user_model.dart';
import '../models/requests/sign_in_body.dart';
import '../models/requests/sign_up_body.dart';

class AuthRepo extends BaseRepository {
  final ApiClient _apiClient;
  final CacheClient _cacheClient;

  AuthRepo(this._apiClient, this._cacheClient, super.networkInfo);

  bool get isAuthed => _cacheClient.get(StorageKeys.isAuthed) ?? false;

  Future<Either<Failure, UserModel>> signIn(SignInBody signInBody) async {
    return super.call<UserModel>(
      httpRequest: () async {
        final response = await _apiClient.post(url: EndPoints.signIn, requestBody: await signInBody.toJson());
        if (response.data["success"] != null && response.data["success"]) {
          await _cacheClient.save(StorageKeys.token, response.data["data"]["api_token"]);
          await _cacheClient.save(StorageKeys.isAuthed, true);
        }
        return response;
      },
      successReturn: (data) => UserModel.fromJson(data),
    );
  }

  Future<Either<Failure, UserModel>> signUp(SignUpBody signUpBody) async {
    return super.call<UserModel>(
      httpRequest: () async {
        final response = await _apiClient.post(url: EndPoints.signUp, requestBody: await signUpBody.toJson());
        if (response.data["success"] != null && response.data["success"]) {
          await _cacheClient.save(StorageKeys.token, response.data["data"]["api_token"]);
          await _cacheClient.save(StorageKeys.isAuthed, true);
        }
        return response;
      },
      successReturn: (data) => UserModel.fromJson(data),
    );
  }

  Future<Either<Failure, String>> signOut() async {
    try {
      await _cacheClient.delete(StorageKeys.isAuthed);
      await _cacheClient.delete(StorageKeys.token);
      await _cacheClient.delete(StorageKeys.currentAddress);
      return Right(AppStrings.signedOutSuccessfully.tr);
    } on Exception catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
