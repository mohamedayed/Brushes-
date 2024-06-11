import '../../../../core/utils/json_utils.dart';

class Tax {
  final int id;
  final String name;
  final String type;
  final num value;

  Tax({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        type: JsonUtils.parseStringFromJson(json['type']),
        value: JsonUtils.parseNumFromJson(json['value']),
      );

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "value": value, "type": type};
  }
}
