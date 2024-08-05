import '../../../profile/models/responses/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String? id;
  String? name;
  String? lastMessage;
  int? lastMessageTime;
  List<int>? readByUsers;
  List<int>? visibleToUsers;
  List<UserModel>? users;

  Chat({
    this.id,
    this.name = "",
    this.lastMessage,
    this.lastMessageTime,
    this.readByUsers,
    required this.users,
  }) {
    visibleToUsers = users?.map((user) => user.id).toList();
    readByUsers = [];
  }

  Chat.fromDocumentSnapshot(DocumentSnapshot json) {
    try {
      id = json.id;
      name = json.get('name')?.toString() ?? "";
      readByUsers = json.get('read_by_users') != null ? List.from(json.get('read_by_users')) : [];
      visibleToUsers = json.get('visible_to_users') != null ? List.from(json.get('visible_to_users')) : [];
      lastMessage = json.get('message')?.toString() ?? "";
      lastMessageTime = json.get('time') ?? 0;
      users = json.get('users') != null
          ? List.from(json.get('users')).map((element) {
              element['media'] = [
                {'thumb': element['thumb']}
              ];
              return UserModel.fromJson(element);
            }).toList()
          : [];
    } catch (e) {
      id = '';
      name = '';
      readByUsers = [];
      users = [];
      lastMessage = '';
      lastMessageTime = 0;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "users": users?.map((element) => element.toRestrictMap()).toSet().toList(),
      "visible_to_users": users?.map((element) => element.id).toSet().toList(),
      "read_by_users": readByUsers,
      "message": lastMessage,
      "time": lastMessageTime,
    };
  }

  Map<String, dynamic> toUpdatedMap() {
    return {
      "message": lastMessage,
      "time": lastMessageTime,
      "read_by_users": readByUsers,
    };
  }
}
