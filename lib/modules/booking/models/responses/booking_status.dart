import 'package:flutter/material.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/json_utils.dart';

class BookingStatus {
  final int id;
  final String status;
  final Color color;
  final int order;

  BookingStatus({
    required this.id,
    required this.status,
    required this.color,
    required this.order,
  });

  factory BookingStatus.fromJson(Map<String, dynamic> json) => BookingStatus(
        id: JsonUtils.parseIntFromJson(json['id']),
        status: JsonUtils.parseStringFromJson(json['status']),
        order: JsonUtils.parseIntFromJson(json['order']),
        color: _getColor(JsonUtils.parseIntFromJson(json['id'])),
      );

  static Color _getColor(int id) {
    switch (id) {
      case 1:
        return AppColors.inProgressBooking;
      case 3:
        return AppColors.warning;
      case 6:
        return AppColors.acceptedBooking;
      case 7:
        return AppColors.warning;
      default:
        return AppColors.primary;
    }
  }
}
