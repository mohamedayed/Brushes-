import 'dart:core';

import '../../../../core/utils/json_utils.dart';

class AvailabilityHour {
  final int id;
  final String day;
  final String startAt;
  final String endAt;
  final String data;

  AvailabilityHour({
    required this.id,
    required this.day,
    required this.startAt,
    required this.endAt,
    required this.data,
  });

  factory AvailabilityHour.fromJson(Map<String, dynamic> json) {
    return AvailabilityHour(
      id: JsonUtils.parseIntFromJson(json['id']),
      day: JsonUtils.parseStringFromJson(json['day']),
      startAt: JsonUtils.parseStringFromJson(json['start_at']),
      endAt: JsonUtils.parseStringFromJson(json['end_at']),
      data: JsonUtils.parseStringFromJson(json['data']),
    );
  }
}
