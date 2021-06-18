import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Models/Product.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class PetPage extends StatefulWidget {
  @override
  _PetPageState createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
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
  int _quantity = 1;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    _controller.text = '$_quantity';
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: RawScrollbar(
          thumbColor: Color(0xFF9D9D9D),
          radius: Radius.circular(4),
          thickness: 8,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: FractionallySizedBox(
                                widthFactor: 0.9,
                                heightFactor: 0.9,
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.fill,
                                ),
                              )),
                              Expanded(
                                  child: FractionallySizedBox(
                                widthFactor: 0.9,
                                heightFactor: 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Breed:',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xFF000000),
                                      thickness: 1,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 30),
                                      child: Text(product.description),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  MyColor.FONTCOLOR)),
                                      onPressed: () => {},
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: 349,
                                          height: 52,
                                          child: Text(
                                            'Liên Hệ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Chi Tiết',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          )),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Container(
                        height: 200,
                        child: Table(
                          border: TableBorder.all(color: Color(0xffAAAAAA)),
                          children: [
                            buildTableRow('Thuộc tính', 'Giá trị'),
                            buildTableRowItem('Chủng loài', 'Husky'),
                            buildTableRowItem('Độ tuổi', '2 tháng'),
                            buildTableRowItem('Nguồn gốc', 'Việt Nam')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow(String attribute, String value) {
    return TableRow(
        decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              attribute,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          )
        ]);
  }

  TableRow buildTableRowItem(String attribute, String value) {
    return TableRow(
        decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              attribute,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              textAlign: TextAlign.center,
            ),
          )
        ]);
  }
}
