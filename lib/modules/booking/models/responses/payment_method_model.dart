import '../../../../core/base/models/en_ar_model.dart';

import '../../../../core/base/models/media_model.dart';
import '../../../../core/utils/json_utils.dart';
import 'wallet_model.dart';

class PaymentMethod {
  final int id;
  final EnArModel name;
  final EnArModel description;
  final Media logo;
  final String route;
  final int order;
  final bool isDefault;
  final Wallet? wallet;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.description,
    required this.route,
    required this.logo,
    required this.wallet,
    required this.isDefault,
    required this.order,
  });

  // Factory constructor to create an instance from JSON
  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: EnArModel.fromJson(json['name'] ?? {}),
        description: EnArModel.fromJson(json['description'] ?? {}),
        route: JsonUtils.parseStringFromJson(json['route']),
        logo: Media.fromJson(List.from(json['media'] ?? {}).isEmpty ? {} : List.from(json['media'] ?? {})[0]),
        order: JsonUtils.parseIntFromJson(json['order']),
        isDefault: JsonUtils.parseBoolFromJson(json['default']),
        wallet: json['wallet'] == null ? null : Wallet.fromJson(json['wallet']),
      );
}
