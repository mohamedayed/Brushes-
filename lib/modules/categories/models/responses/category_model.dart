import '../../../../core/base/models/en_ar_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';
import '../../../e_service/models/responses/e_service_model.dart';

class CategoryModel {
  final int id;
  final EnArModel name;
  final String description;
  final Color color;
  final Media image;
  final bool featured;
  final List<CategoryModel> subCategories;
  final List<EService> eServices;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.image,
    required this.featured,
    required this.subCategories,
    required this.eServices,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: EnArModel.fromJson(json['name'] ?? {}),
        description: JsonUtils.parseStringFromJson(json['description']),
        color: JsonUtils.parseColorFromJson(json['color']),
        image: JsonUtils.mediaFromJson(json['media']),
        featured: JsonUtils.parseBoolFromJson(json['featured']),
        eServices: json["e_services"] == null && json["featured_e_services"] == null
            ? []
            : List<EService>.from((json["e_services"] ?? json["featured_e_services"]).map((s) => EService.fromJson(s))),
        subCategories: json["sub_categories"] == null
            ? []
            : List<CategoryModel>.from(json["sub_categories"].map((category) => CategoryModel.fromJson(category))),
      );
}
