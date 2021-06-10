import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String name;
  String phone;
  late String address;
  late String note;
  User({required this.name, required this.phone});

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
