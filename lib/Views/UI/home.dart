import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: RawScrollbar(
        thumbColor: Color(0xFF9D9D9D),
        radius: Radius.circular(4),
        thickness: 8,
        isAlwaysShown: true,
        child: PageView(
            pageSnapping: false,
            controller: controller,
            scrollDirection: Axis.vertical,
            children: [
              Column(
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
                    child: Image.asset(
                      'assets/images/dog.png',
                      fit: BoxFit.fill,
                    ),
                    flex: 8,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(90),
                                bottomRight: Radius.circular(90))),
                      ),
                    ),
                    Flexible(
                      child: Column(),
                      flex: 5,
                    ),
                    Flexible(
                      child: Column(),
                      flex: 5,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
