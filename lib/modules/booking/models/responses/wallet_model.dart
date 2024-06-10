import '../../../../core/utils/json_utils.dart';

class Wallet {
  final int id;
  final String name;
  final num balance;

  Wallet({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: JsonUtils.parseIntFromJson(json['id']),
        name: JsonUtils.parseStringFromJson(json['name']),
        balance: JsonUtils.parseNumFromJson(json['balance']),
      );

  Map<String, dynamic> toJson() => {
        'id': JsonUtils.parseStringFromJson(id),
        'name': JsonUtils.parseStringFromJson(name),
        'balance': JsonUtils.parseNumFromJson(balance),
      };
}
