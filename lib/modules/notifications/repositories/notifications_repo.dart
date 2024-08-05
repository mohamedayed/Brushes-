import '../../../core/services/network/endpoints.dart';
import '../../../core/utils/globals.dart';
import '../../profile/models/responses/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/error/failure.dart';
import '../../../core/services/network/api_client.dart';
import '../../../core/base/repositories/base_repository.dart';
import '../models/responses/notification_model.dart';

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

  Future<Either<Failure, bool>> sendNotification(
    List<UserModel> users,
    UserModel from,
    String type,
    String text,
    String id,
  ) async {
    return super.call<bool>(
      httpRequest: () => _apiClient.post(
        url: EndPoints.notifications,
        requestBody: {
          'users': users.map((e) => e.id).toList(),
          'from': from.id,
          'type': type,
          'text': text,
          'id': id,
        },
      ),
      successReturn: (data) => data,
    );
  }

  Future<Either<Failure, List<Notification>>> getNotifications() {
    return super.call<List<Notification>>(
      httpRequest: () => _apiClient.get(
        url: EndPoints.notifications,
        queryParameters: {
          'search': 'notifiable_id:${currentUser.value!.id}',
          'searchFields': 'notifiable_id:=',
          'searchJoin': 'and',
          'orderBy': 'created_at',
          'sortedBy': 'desc',
          'limit': '50',
          'only': 'id;type;data;read_at;created_at',
        },
      ),
      successReturn: (data) => List<Notification>.from(data.map((notification) => Notification.fromJson(notification))),
    );
  }

  Future<Either<Failure, Notification>> removeNotification(String id) async {
    return super.call<Notification>(
      httpRequest: () => _apiClient.delete(url: '${EndPoints.notifications}/$id'),
      successReturn: (data) => Notification.fromJson(data),
    );
  }

  Future<Either<Failure, Notification>> markAsReadNotification(Notification notification) async {
    return super.call<Notification>(
      httpRequest: () => _apiClient.update(
        url: '${EndPoints.notifications}/${notification.id}',
        requestBody: notification.markReadMap(),
      ),
      successReturn: (data) => Notification.fromJson(data),
    );
  }
}
