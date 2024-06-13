import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../../../core/services/network/endpoints.dart';
import '../../../core/utils/globals.dart';
import '../models/requests/edit_profile_body.dart';
import '../models/responses/user_model.dart';

class ProfileRepo extends BaseRepository {
  final ApiClient _apiClient;

  ProfileRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, UserModel>> getProfile() async {
    return super.call<UserModel>(
      httpRequest: () => _apiClient.get(url: EndPoints.getProfile),
      successReturn: (data) => UserModel.fromJson(data),
    );
  }

  Future<Either<Failure, UserModel>> editProfile(EditProfileBody editProfileBody) async {
    return super.call<UserModel>(
      httpRequest: () => _apiClient.post(
        url: "${EndPoints.users}/${currentUser.value!.id}",
        requestBody: editProfileBody.toJson(),
      ),
      successReturn: (data) => UserModel.fromJson(data),
    );
  }
}
