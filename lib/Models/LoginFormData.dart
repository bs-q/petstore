import 'dart:convert';

class LoginFormData {
  final String email;
  final String password;

  LoginFormData(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
