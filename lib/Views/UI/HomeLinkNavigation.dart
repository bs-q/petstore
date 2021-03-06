import 'package:flutter/material.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:petstore/Views/Utils/TextLink.dart';

class HomeLinkNavigation extends StatelessWidget {
  const HomeLinkNavigation(
      {Key? key,
      required this.text,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.setState})
      : super(key: key);

  final CustomHover text;
  final CustomHover text2;
  final CustomHover text3;
  final CustomHover text4;
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextLink(
              customHover: text,
              setState: setState,
              text: 'Sản phẩm cho chó',
              onClick: () => {},
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextLink(
              customHover: text2,
              setState: setState,
              text: 'Sản phẩm cho mèo',
              onClick: () => {},
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextLink(
              customHover: text3,
              setState: setState,
              text: 'Sản phẩm cho vật nuôi khác',
              onClick: () => {},
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextLink(
              customHover: text4,
              setState: setState,
              text: 'Vật nuôi được ưa chuộng',
              onClick: () => {},
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
