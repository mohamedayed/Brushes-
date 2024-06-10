import 'package:brushes/core/base/models/en_ar_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';

class HomeSliderModel {
  final int id;
  final int order;
  final EnArModel text;
  final EnArModel button;
  final String textPosition;
  final Color textColor;
  final Color buttonColor;
  final Color backgroundColor;
  final Color indicatorColor;
  final Media image;
  final String imageFit;
  int? eServiceId;
  int? salonId;
  final bool enabled;

  HomeSliderModel({
    required this.id,
    required this.order,
    required this.text,
    required this.button,
    required this.textPosition,
    required this.textColor,
    required this.buttonColor,
    required this.backgroundColor,
    required this.indicatorColor,
    required this.image,
    required this.imageFit,
    required this.eServiceId,
    required this.salonId,
    required this.enabled,
  });

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) => HomeSliderModel(
        id: JsonUtils.parseIntFromJson(json['id']),
        order: JsonUtils.parseIntFromJson(json['order']),
        text: EnArModel.fromJson(json['text']),
        button: EnArModel.fromJson(json['button']),
        textPosition: JsonUtils.parseStringFromJson(json['text_position']),
        textColor: JsonUtils.parseColorFromJson(json['text_color']),
        buttonColor: JsonUtils.parseColorFromJson(json['button_color']),
        backgroundColor: JsonUtils.parseColorFromJson(json['background_color']),
        indicatorColor: JsonUtils.parseColorFromJson(json['indicator_color']),
        image: JsonUtils.mediaFromJson(json['media']),
        imageFit: JsonUtils.parseStringFromJson(json['image_fit']),
        eServiceId: json['e_service_id'],
        salonId: json['salon_id'],
        enabled: JsonUtils.parseBoolFromJson(json['enabled']),
      );
}
