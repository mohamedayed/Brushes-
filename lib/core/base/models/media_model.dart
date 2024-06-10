import '../../utils/json_utils.dart';

class Media {
  final String id;
  final String name;
  final String url;
  final String thumb;
  final String icon;
  final String size;

  Media({
    required this.id,
    required this.name,
    required this.url,
    required this.thumb,
    required this.icon,
    required this.size,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: JsonUtils.parseStringFromJson(json['id']),
      name: JsonUtils.parseStringFromJson(json['name']),
      url: JsonUtils.parseStringFromJson(json['url']),
      thumb: JsonUtils.parseStringFromJson(json['thumb']),
      icon: JsonUtils.parseStringFromJson(json['icon']),
      size: JsonUtils.parseStringFromJson(json['formatted_size']),
    );
  }
}
