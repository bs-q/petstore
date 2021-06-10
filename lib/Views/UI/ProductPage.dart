import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int _quantity = 1;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                                  'assets/images/dog.png',
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
                                      'Hamster Robo',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'type:',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 30),
                                          child: Text('category:',
                                              style: TextStyle(
                                                fontSize: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xFF000000),
                                      thickness: 1,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: 'status: ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                          children: [
                                            TextSpan(
                                                text: 'Còn hàng',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFF1CB122),
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ]),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'price:  ',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                            children: [
                                          TextSpan(
                                              text: '50000',
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w400))
                                        ])),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 30, bottom: 30),
                                      child: Text(
                                          "Female Roborovski Dwarf Hamsters are always up to something and are ideal if you are looking for a pet that's fun to watch, but requires less personal handling."),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text('Số lượng',
                                            overflow: TextOverflow.ellipsis)),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 30),
                                          width: 172,
                                          height: 52,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff000000))),
                                          child: Material(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    color: Color(0xff858585),
                                                    icon: Icon(Icons.remove),
                                                    splashRadius: 20,
                                                    tooltip: 'Bớt số lượng',
                                                    onPressed: () {
                                                      setState(() {
                                                        _quantity--;
                                                      });
                                                    }),
                                                Flexible(
                                                  child: Center(
                                                    child: TextField(
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      onChanged: (value) {
                                                        _quantity = int.parse(
                                                            _controller.text);
                                                      },
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller: _controller,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                    color: Color(0xff858585),
                                                    tooltip: 'Thêm số lượng',
                                                    icon: const Icon(Icons.add),
                                                    splashRadius: 20,
                                                    onPressed: () {
                                                      setState(() {
                                                        _quantity++;
                                                      });
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        MyColor.FONTCOLOR)),
                                            onPressed: () => {
                                              
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                width: 349,
                                                height: 52,
                                                child: Text(
                                                  'Thêm vào giỏ hàng',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                        ),
                                      ],
                                    )
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
                            buildTableRowItem('Trọng lượng', '50kg'),
                            buildTableRowItem('Xuất xứ', 'Việt Nam'),
                            buildTableRowItem('Thương hiệu', 'BQP')
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
