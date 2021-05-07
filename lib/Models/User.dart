import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String name;
  User({
    required this.name,
  });

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }
}
