import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';

class Option {
  final int id;
  final String optionGroupId;
  final String eServiceId;
  final String name;
  final num price;
  final Media image;
  final String description;

  Option({
    required this.id,
    required this.optionGroupId,
    required this.eServiceId,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: JsonUtils.parseIntFromJson(json['id']),
        optionGroupId: JsonUtils.parseStringFromJson(json['option_group_id']),
        eServiceId: JsonUtils.parseStringFromJson(json['e_service_id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        price: JsonUtils.parseNumFromJson(json['price']),
        description: JsonUtils.parseStringFromJson(json['description']),
        image: Media.fromJson(json['image'] ?? {}),
      );
}
