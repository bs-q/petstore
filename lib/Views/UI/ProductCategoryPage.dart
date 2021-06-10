import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/UI/ProductItemInCategory.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class ProductCategoryPage extends StatefulWidget {
  @override
  _ProductCategoryPageState createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height / 4.6,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: HomepageHeader(),
                        fit: FlexFit.tight,
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
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Tìm Kiếm Theo Danh Mục',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 46),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffC4C4C4),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Loại',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '< Thức ăn cho chó',
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      Text(
                                        '< Thức ăn cho mèo',
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Loài',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '< chó',
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                      Text(
                                        '< mèo',
                                        style: TextStyle(
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Trạng thái',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            '<  Đã hết hàng',
                                            style: TextStyle(
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 2,
                      ),
                      Flexible(
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: [
                            for (var i = 0; i < 12; i++)
                              ProductItemInCategory(
                                  imageLink: 'assets/images/rat.png',
                                  description:
                                      "Female Roborovski Dwarf Hamsters are always up to something and are ideal if you are looking for a pet that's fun to watch, but requires less personal handling.",
                                  itemId: 1,
                                  itemName: 'Hamster robo',
                                  buttonText: 'Mua ngay',
                                  path: '/product')
                          ],
                        ),
                        flex: 8,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
