import 'dart:convert';

import 'package:brushes/core/utils/json_utils.dart';
import 'package:get/get.dart';

class Notification {
  final String id;
  final String type;
  final Map<String, dynamic> data;
  bool read;
  final DateTime createdAt;

  Notification({
    required this.id,
    required this.type,
    required this.data,
    required this.read,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: JsonUtils.parseStringFromJson(json["id"]),
      type: JsonUtils.parseStringFromJson(json["type"]),
      data: jsonDecode(json["data"] ?? "") ?? {},
      read: json['read_at'] != null,
      createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'data': data,
      'read_at': read ? DateTime.now().toIso8601String() : null,
      'created_at': createdAt.toIso8601String(),
    };
  }

  Map<String, dynamic> markReadMap() {
    return {
      'id': id,
      'read_at': !read ? DateTime.now().toIso8601String() : null,
    };
  }

  // Generates a message string based on notification type and data
  String getMessage() {
    if (type == 'App\\Notifications\\NewMessage' && data['from'] != null) {
      return '${data['from']} ${'NewMessage'.tr}';
    } else if (data.containsKey('booking_id')) {
      return '#${data['booking_id']} ${type.tr}';
    } else {
      return data["message"] ?? "";
    }
  }
}
