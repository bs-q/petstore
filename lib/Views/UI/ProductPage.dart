import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CustomHover text = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text2 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text3 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text4 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: HomepageHeader(),
            fit: FlexFit.tight,
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: HomeLinkNavigation(
              text: text,
              text2: text2,
              text3: text3,
              text4: text4,
              setState: setState,
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Image.asset(
                  'assets/images/dog.png',
                  fit: BoxFit.fill,
                )),
                Expanded(child: Container())
              ],
            ),
            flex: 8,
          ),
        ],
      ),
    );
  }
}
