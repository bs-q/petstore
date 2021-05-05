import 'package:flutter/material.dart';
import 'package:petstore/Views/UI/home_header.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:petstore/Views/Utils/TextLink.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CustomHover text = CustomHover(
      onOutColor: Color(0xFF074EE8),
      underlineOnHover: true,
      baseColor: Color(0xFF074EE8),
      onHoverColor: Color(0xFF074EE8));

  final CustomHover text2 = CustomHover(
      onOutColor: Color(0xFF074EE8),
      underlineOnHover: true,
      baseColor: Color(0xFF074EE8),
      onHoverColor: Color(0xFF074EE8));

  final CustomHover text3 = CustomHover(
      onOutColor: Color(0xFF074EE8),
      underlineOnHover: true,
      baseColor: Color(0xFF074EE8),
      onHoverColor: Color(0xFF074EE8));

  final CustomHover text4 = CustomHover(
      onOutColor: Color(0xFF074EE8),
      underlineOnHover: true,
      baseColor: Color(0xFF074EE8),
      onHoverColor: Color(0xFF074EE8));

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.blue),
                )
              ],
            )
          ]),
    );
  }
}

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
              text: 'San pham cho cho',
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
              text: 'San pham cho meo',
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
              text: 'San pham cho vat nuoi khac',
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
              text: 'vat nuoi duoc ua chuong',
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
