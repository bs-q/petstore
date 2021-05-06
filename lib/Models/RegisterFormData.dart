import 'dart:convert';

class RegisterFormData {
  final String email;
  final String password;
  final String fullName;
  final String phone;
  final String address;

  RegisterFormData(
      this.email, this.password, this.fullName, this.phone, this.address);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'phone': phone,
      'address': address,
    };
  }

  String toJson() => json.encode(toMap());
}
