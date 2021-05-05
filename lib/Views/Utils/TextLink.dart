import 'package:flutter/material.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class TextLink extends StatelessWidget {
  final CustomHover customHover;
  final Function setState;
  final String text;
  final Function onClick;
  final double? fontSize;
  final FontWeight? fontWeight;
  TextLink(
      {required this.customHover,
      required this.setState,
      required this.text,
      required this.onClick,
      this.fontSize,
      this.fontWeight,});
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) => {customHover.incrementEnter(details, setState)},
      onHover: (details) => {customHover.updateLocation(details, setState)},
      onExit: (details) => {customHover.incrementExit(details, setState)},
      child: GestureDetector(
        child: Text(
          '$text',
          style: TextStyle(
              color: customHover.baseColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              decoration:
                  customHover.underline? TextDecoration.underline : TextDecoration.none),
        ),
        onTap: () => {onClick()},
      ),
    );
  }
}