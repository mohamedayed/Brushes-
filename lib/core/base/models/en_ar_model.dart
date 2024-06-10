class EnArModel {
  final String en;
  final String ar;

  EnArModel({required this.en, required this.ar});

  factory EnArModel.fromJson(Map<String, dynamic> json) => EnArModel(en: json["en"] ?? "", ar: json["ar"] ?? "");
}
