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
    return Scaffold(
      body: RawScrollbar(
        thumbColor: Color(0xFF9D9D9D),
        radius: Radius.circular(4),
        thickness: 8,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
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
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        child: Text(
                          'THÚ CƯNG',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        padding: EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: MyColor.FONTCOLOR,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(90),
                                bottomRight: Radius.circular(90))),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/images/rat.png'),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Hamster Robo',
                                        style: TextStyle(
                                            color:
                                                MyColor.ITEM_NAME_FONT_COLOR),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Tình trạng: Khỏe'),
                                          Text('Giống: '),
                                          Text('Tình trạng: Khỏe'),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () => {},
                                        child: Text('Liên Hệ'))
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 7,
                    ),
                    Flexible(
                      child: Row(),
                      flex: 7,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )
          ]),
        ),
      ),
    );
  }
}
