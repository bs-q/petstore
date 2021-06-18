import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String name;
  String phone;
  String address;
  late String note;
  String password;
  String email;
  User(
      {required this.name,
      required this.phone,
      this.email = '',
      this.address = '',
      this.password = ''});

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  void updateAddress(String address) {
    this.address = address;
    notifyListeners();
  }

  void updateNote(String note) {
    this.note = note;
    notifyListeners();
  }
}
