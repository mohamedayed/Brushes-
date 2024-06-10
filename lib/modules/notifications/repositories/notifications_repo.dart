import 'package:brushes/core/services/network/endpoints.dart';
import 'package:brushes/core/utils/globals.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';

class NotificationsRepo extends BaseRepository {
  final ApiClient _apiClient;

  NotificationsRepo(this._apiClient, super.networkInfo);

  Future<Either<Failure, int>> getNotificationsCount() async {
    return super.call<int>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.getNotificationsCount,
        queryParameters: {
          'search': 'notifiable_id:${currentUser.value!.id}',
          'searchFields': 'notifiable_id:=',
          'searchJoin': 'and',
          'api_token': currentUser.value!.apiToken,
        },
      ),
      successReturn: (data) => data,
    );
  }
}
