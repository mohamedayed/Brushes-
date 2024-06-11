import '../../../addresses/models/responses/address_model.dart';
import '../../../e_service/models/responses/e_service_model.dart';
import '../../../e_service/models/responses/option_model.dart';
import '../../../profile/models/responses/user_model.dart';
import '../../../salon/models/responses/salon_model.dart';

class BookingBody {
  List<EService>? eServices;
  Salon? salon;
  UserModel? employee;
  List<Option>? options;
  int? quantity;
  String? couponCode;
  double? couponValue;
  String? hint;
  String? bookingTime;
  Address? address;

  BookingBody({
    this.eServices,
    this.salon,
    this.employee,
    this.options,
    this.quantity,
    this.couponCode,
    this.couponValue,
    this.hint,
    this.bookingTime,
    this.address,
  });

  void copyWith({
    List<EService>? eServices,
    Salon? salon,
    UserModel? employee,
    List<Option>? options,
    int? quantity,
    String? couponCode,
    double? couponValue,
    String? hint,
    String? bookingTime,
    Address? address,
  }) {
    this.eServices = eServices ?? this.eServices;
    this.salon = salon ?? this.salon;
    this.employee = employee ?? this.employee;
    this.options = options ?? this.options;
    this.quantity = quantity ?? this.quantity;
    this.couponCode = couponCode ?? this.couponCode;
    this.couponValue = couponValue ?? this.couponValue;
    this.hint = hint ?? this.hint;
    this.bookingTime = bookingTime ?? this.bookingTime;
    this.address = address ?? this.address;
  }

  Map<String, dynamic> toJson() {
    return {
      if (eServices != null) "e_services": eServices!.map((e) => e.id).toList(),
      if (salon != null) "taxes": salon!.taxes.map((tax) => tax.toJson()).toList(),
      if (salon != null) "salon_id": salon!.id,
      if (employee != null) "employee_id": employee!.id,
      if (options != null) "options": options!.map((option) => option.id).toList(),
      if (quantity != null) "quantity": quantity,
      if (couponCode != null) "code": couponCode,
      if (hint != null) "hint": hint,
      if (bookingTime != null) "booking_at": bookingTime,
      if (address != null) "address": address!.toJson(),
    };
  }

  bool get canBookAtSalon =>
      eServices?.fold<bool>(true, (previousValue, service) => previousValue && service.enableAtSalon) ?? false;

  bool get canBookAtCustomerAddress =>
      eServices?.fold<bool>(true, (previousValue, service) => previousValue && service.enableAtCustomerAddress) ??
      false;

  double get total {
    double total = subtotal;
    total += taxesValue;
    total -= getCouponValue;
    return total;
  }

  double get subtotal {
    double total = 0.0;
    eServices?.forEach((service) => total += service.getPrice * (quantity ?? 1));
    options?.forEach((element) => total += element.price * (quantity ?? 1));
    return total;
  }

  double get taxesValue {
    double taxValue = 0.0;
    salon?.taxes.forEach((element) {
      element.type == 'percent' ? taxValue += (subtotal * element.value / 100) : taxValue += element.value;
    });
    return taxValue;
  }

  double get getCouponValue => couponValue ?? 0;
}
