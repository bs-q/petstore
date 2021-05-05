import 'package:flutter/material.dart';

class CustomHover {
  Color onHoverColor;
  Color onOutColor;
  Color? baseColor;
  // ignore: unused_field
  int _enterCounter = 0;
  // ignore: unused_field
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;
  bool underline = false;
  bool underlineOnHover;
  CustomHover(
      {this.onHoverColor = Colors.blue,
      this.onOutColor = Colors.black,
      this.baseColor = Colors.black,
      this.underlineOnHover = false});
  void incrementEnter(PointerEvent details, Function callBack) {
    callBack(() {
      _enterCounter++;
    });
  }

  void incrementExit(PointerEvent details, Function callBack) {
    callBack(() {
      baseColor = onOutColor;
      underline = false;
      _exitCounter++;
    });
  }

  void updateLocation(PointerEvent details, Function callBack) {
    callBack(() {
      baseColor = onHoverColor;
      underline = underlineOnHover ? true : false;
      x = details.position.dx;
      y = details.position.dy;
    });
  }
}
