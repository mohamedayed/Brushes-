import 'package:brushes/modules/profile/models/responses/user_model.dart';

import '../../../../core/utils/json_utils.dart';
import '../../../addresses/models/responses/address_model.dart';
import '../../../e_service/models/responses/e_service_model.dart';
import '../../../e_service/models/responses/option_model.dart';
import '../../../salon/models/responses/salon_model.dart';
import '../../../salon/models/responses/tax_model.dart';
import 'booking_status.dart';
import 'coupon.dart';
import 'payment.dart';

class Booking {
  final int id;
  final String hint;
  final bool cancel;
  final bool atSalon;
  final num duration;
  final int quantity;
  final BookingStatus status;
  final UserModel user;
  final UserModel employee;
  final List<EService> eServices;
  final Salon salon;
  final List<Option> options;
  final List<Tax> taxes;
  final Address address;
  final Coupon coupon;
  final DateTime bookingAt;
  final DateTime startAt;
  final DateTime endsAt;
  final Payment payment;

  Booking({
    required this.id,
    required this.hint,
    required this.cancel,
    required this.atSalon,
    required this.duration,
    required this.quantity,
    required this.status,
    required this.user,
    required this.employee,
    required this.eServices,
    required this.salon,
    required this.options,
    required this.taxes,
    required this.address,
    required this.coupon,
    required this.bookingAt,
    required this.startAt,
    required this.endsAt,
    required this.payment,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: JsonUtils.parseIntFromJson(json['id']),
        hint: JsonUtils.parseStringFromJson(json['hint']),
        cancel: JsonUtils.parseBoolFromJson(json['cancel']),
        atSalon: JsonUtils.parseBoolFromJson(json['at_salon']),
        duration: JsonUtils.parseNumFromJson(json['duration']),
        quantity: JsonUtils.parseIntFromJson(json['quantity']),
        status: BookingStatus.fromJson(json['booking_status'] ?? {}),
        user: UserModel.fromJson(json['user'] ?? {}),
        employee: UserModel.fromJson(json['employee'] ?? {}),
        eServices: List<EService>.from(json['e_services'].map((service) => EService.fromJson(service))),
        salon: Salon.fromJson(json['salon'] ?? {}),
        address: Address.fromJson(json['address'] ?? {}),
        coupon: Coupon.fromJson(json['coupon'] ?? {}),
        payment: Payment.fromJson(json['payment'] ?? {}),
        options: List<Option>.from(json['options'].map((option) => Option.fromJson(option))),
        taxes: List<Tax>.from(json['taxes'].map((tax) => Tax.fromJson(tax))),
        bookingAt: JsonUtils.parseDatetimeFromJson(json['booking_at']),
        startAt: JsonUtils.parseDatetimeFromJson(json['start_at']),
        endsAt: JsonUtils.parseDatetimeFromJson(json['ends_at']),
      );
}
