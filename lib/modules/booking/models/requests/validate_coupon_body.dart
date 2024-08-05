import '../../../e_service/models/responses/e_service_model.dart';

class ValidateCouponBody {
  String? coupon;
  List<EService>? eServices;
  int? salonId;

  ValidateCouponBody({
    this.coupon,
    this.eServices,
    this.salonId,
  });

  void copyWith({
    String? coupon,
    List<EService>? eServices,
    int? salonId,
  }) {
    this.coupon = coupon ?? this.coupon;
    this.eServices = eServices ?? this.eServices;
    this.salonId = salonId ?? this.salonId;
  }

  Map<String, dynamic> toJson() => {
        if (coupon != null) 'code': coupon,
        if (eServices != null) 'e_services_id': eServices!.map((service) => service.id).join(","),
        if (salonId != null) 'salon_id': salonId,
        if (eServices != null)
          'categories_id': eServices!
              .expand((service) => service.categories + service.subCategories)
              .map((category) => category.id)
              .join(","),
      };
}
