import 'package:brushes/core/base/models/en_ar_model.dart';
import 'package:brushes/modules/categories/models/responses/category_model.dart';

import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';
import '../../../salon/models/responses/salon_model.dart';
import 'option_group_model.dart';

class EService {
  final int id;
  final EnArModel name;
  final EnArModel description;
  final List<Media> images;
  final num price;
  final num discountPrice;
  final String duration;
  final bool featured;
  final bool enableBooking;
  final bool enableAtSalon;
  final bool enableAtCustomerAddress;
  final bool isFavorite;
  final List<CategoryModel> categories;
  final List<CategoryModel> subCategories;
  final List<OptionGroup> optionGroups;
  final Salon salon;

  EService({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.discountPrice,
    required this.duration,
    required this.featured,
    required this.enableBooking,
    required this.enableAtSalon,
    required this.enableAtCustomerAddress,
    required this.isFavorite,
    required this.categories,
    required this.subCategories,
    required this.optionGroups,
    required this.salon,
  });

  factory EService.fromJson(Map<String, dynamic> json) {
    return EService(
      id: JsonUtils.parseIntFromJson(json['id']),
      name: EnArModel.fromJson(json['name']),
      description: EnArModel.fromJson(json['description'] ?? {}),
      images: json['media'] == null ? [] : List<Media>.from(json['media'].map((image) => Media.fromJson(image))),
      price: JsonUtils.parseNumFromJson(json['price']),
      discountPrice: JsonUtils.parseNumFromJson(json['discount_price']),
      duration: JsonUtils.parseDurationFromJson(json['duration']),
      featured: JsonUtils.parseBoolFromJson(json['featured']),
      enableBooking: JsonUtils.parseBoolFromJson(json['enable_booking']),
      enableAtSalon: JsonUtils.parseBoolFromJson(json['enable_at_salon']),
      enableAtCustomerAddress: JsonUtils.parseBoolFromJson(json['enable_at_customer_address']),
      isFavorite: JsonUtils.parseBoolFromJson(json['is_favorite']),
      categories: json["categories"] == null
          ? []
          : List<CategoryModel>.from(json["categories"].map((category) => CategoryModel.fromJson(category))),
      subCategories: json["sub_categories"] == null
          ? []
          : List<CategoryModel>.from(json["sub_categories"].map((category) => CategoryModel.fromJson(category))),
      optionGroups: json["option_groups"] == null
          ? []
          : List<OptionGroup>.from(json["option_groups"].map((group) => OptionGroup.fromJson(group))),
      salon: Salon.fromJson(json['salon'] ?? {}),
    );
  }

  num get getPrice => discountPrice > 0 ? discountPrice : price;
}
