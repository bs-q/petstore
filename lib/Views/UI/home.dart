import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Services/ProductList.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomePetAndSupplies.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/UI/ProductItem.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:provider/provider.dart';

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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                child: Consumer<ProductList>(
                    builder: (context, productList, child) {
                  return Padding(
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
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                for (var i = 0; i < 4; i++)
                                  Flexible(
                                    child: ProductItem(
                                      imageLink: productList.products[i].image,
                                      description:
                                          productList.products[i].description,
                                      itemId: productList.products[i].id,
                                      itemName: productList.products[i].name,
                                      buttonText: 'Liên Hệ',
                                      path: '/pet',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          flex: 7,
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Flexible(
                                    child: ProductItem(
                                      imageLink: 'assets/images/rat.png',
                                      description:
                                          'Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu',
                                      itemId: 1,
                                      itemName: 'Hamster robo',
                                      buttonText: 'Liên Hệ',
                                      path: '/pet',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          flex: 7,
                        )
                      ],
                    ),
                  );
                }),
              ),
              HomePetAndSupplies()
            ]),
          ),
        ),
      ),
    );
  }
}

