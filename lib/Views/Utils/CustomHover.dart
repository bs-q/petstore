import 'package:flutter/material.dart';

class CustomHover {
  Color textColor = Colors.black;
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void incrementEnter(PointerEvent details,Function callBack) {
    callBack(() {
      _enterCounter++;
    });
  }

  void incrementExit(PointerEvent details,Function callBack) {
    callBack(() {
      textColor = Colors.black;
      _exitCounter++;
    });
  }

  void updateLocation(PointerEvent details,Function callBack) {
    callBack(() {
      textColor = Colors.blue;
      x = details.position.dx;
      y = details.position.dy;
    });
  }
}
