import 'dart:core';

import '../../../../core/utils/json_utils.dart';

class SalonLevel {
  final int id;
  final String name;
  final num commission;

  SalonLevel({
    required this.id,
    required this.name,
    required this.commission,
  });

  // Factory constructor to create an instance from JSON
  factory SalonLevel.fromJson(Map<String, dynamic> json) => SalonLevel(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        commission: JsonUtils.parseNumFromJson(json['commission']),
      );
}
