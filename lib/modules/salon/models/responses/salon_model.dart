import 'dart:core';

import '../../../../core/base/models/en_ar_model.dart';
import '../../../profile/models/responses/user_model.dart';

import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';
import '../../../addresses/models/responses/address_model.dart';
import 'availability_hour_model.dart';
import 'review_model.dart';
import 'salon_level_model.dart';
import 'tax_model.dart';

class Salon {
  final int id;
  final EnArModel name;
  final EnArModel description;
  final List<Media> images;
  final String phoneNumber;
  final String mobileNumber;
  final SalonLevel salonLevel;
  final List<AvailabilityHour> availabilityHours;
  final num availabilityRange;
  final num distance;
  final bool closed;
  final bool featured;
  final Address address;
  final List<Tax> taxes;
  final List<UserModel> employees;
  final num rate;
  final List<Review> reviews;
  final int totalReviews;
  final bool verified;

  Salon({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.phoneNumber,
    required this.mobileNumber,
    required this.salonLevel,
    required this.availabilityHours,
    required this.availabilityRange,
    required this.distance,
    required this.closed,
    required this.featured,
    required this.address,
    required this.taxes,
    required this.employees,
    required this.rate,
    required this.reviews,
    required this.totalReviews,
    required this.verified,
  });

  factory Salon.fromJson(Map<String, dynamic> json) {
    // https://mobile.tcare.ae/api/salons/42?with=salonLevel%3BavailabilityHours%3Busers%3Btaxes%3Baddress
    return Salon(
      id: JsonUtils.parseIntFromJson(json['id']),
      name: EnArModel.fromJson(json['name'] ?? {}),
      description: EnArModel.fromJson(json['description'] ?? {}),
      images: json["media"] == null ? [] : List<Media>.from(json["media"].map((image) => Media.fromJson(image))),
      phoneNumber: JsonUtils.parseStringFromJson(json['phone_number']),
      mobileNumber: JsonUtils.parseStringFromJson(json['mobile_number']),
      salonLevel: SalonLevel.fromJson(json['salon_level'] ?? {}),
      availabilityHours: json["availability_hours"] == null
          ? []
          : List<AvailabilityHour>.from(json["availability_hours"].map((hr) => AvailabilityHour.fromJson(hr))),
      availabilityRange: JsonUtils.parseNumFromJson(json['availability_range']),
      distance: JsonUtils.parseNumFromJson(json['distance']),
      closed: JsonUtils.parseBoolFromJson(json['closed'], defaultValue: true),
      featured: JsonUtils.parseBoolFromJson(json['featured']),
      address: Address.fromJson(json['address'] ?? {}),
      taxes: json["taxes"] == null ? [] : List<Tax>.from(json["taxes"].map((tax) => Tax.fromJson(tax))),
      employees:
          json["users"] == null ? [] : List<UserModel>.from(json["users"].map((user) => UserModel.fromJson(user))),
      rate: JsonUtils.parseNumFromJson(json['rate']),
      reviews: json["salon_reviews"] == null
          ? []
          : List<Review>.from(json["salon_reviews"].map((review) => Review.fromJson(review))),
      totalReviews: JsonUtils.parseIntFromJson(json['total_reviews']),
      verified: JsonUtils.parseBoolFromJson(json['verified']),
    );
  }

  Map<String, List<String>> get groupedAvailabilityHours {
    Map<String, List<String>> result = {};
    for (var element in availabilityHours) {
      if (result.containsKey(element.day)) {
        result[element.day]?.add('${element.startAt} - ${element.endAt}');
      } else {
        result[element.day] = ['${element.startAt} - ${element.endAt}'];
      }
    }
    return result;
  }

  List<String> getAvailabilityHoursData(String day) {
    List<String> result = [];
    for (var element in availabilityHours) {
      if (element.day == day) {
        result.add(element.data);
      }
    }
    return result;
  }
}
