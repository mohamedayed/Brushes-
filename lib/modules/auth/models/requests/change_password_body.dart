class ChangePasswordBody {
  String? oldPassword;
  String? newPassword;
  String? newPasswordConfirmation;

  ChangePasswordBody({this.oldPassword, this.newPassword, this.newPasswordConfirmation});

  void copyWith({
    String? oldPassword,
    String? newPassword,
    String? newPasswordConfirmation,
  }) {
    this.oldPassword = oldPassword ?? this.oldPassword;
    this.newPassword = newPassword ?? this.newPassword;
    this.newPasswordConfirmation = newPasswordConfirmation ?? this.newPasswordConfirmation;
  }

  Map<String, dynamic> toJson() {
    return {
      if (oldPassword != null) "current_password": oldPassword,
      if (newPassword != null) "new_password": newPassword,
    };
  }
}
