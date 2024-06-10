import '../../../../core/utils/json_utils.dart';
import 'option_model.dart';

class OptionGroup {
  final int id;
  final String name;
  final bool allowMultiple;
  final List<Option> options;

  OptionGroup({
    required this.id,
    required this.name,
    required this.allowMultiple,
    required this.options,
  });

  factory OptionGroup.fromJson(Map<String, dynamic> json, {String? eServiceId}) => OptionGroup(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        allowMultiple: JsonUtils.parseBoolFromJson(json['allow_multiple']),
        options: List<Option>.from(json["options"].map((option) => Option.fromJson(option))),
      );
}
