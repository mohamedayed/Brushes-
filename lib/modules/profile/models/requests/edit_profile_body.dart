class EditProfileBody {
  dynamic image;
  String? name;
  String? email;
  String? countryCode;
  String? phoneNumber;

  EditProfileBody({
    this.image,
    this.name,
    this.email,
    this.countryCode,
    this.phoneNumber,
  });

  void copyWith({
    dynamic image,
    String? name,
    String? email,
    String? countryCode,
    String? phoneNumber,
  }) {
    this.image = image ?? this.image;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.countryCode = countryCode ?? this.countryCode;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
