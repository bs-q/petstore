import 'dart:html';

import 'package:flutter/material.dart';

import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Models/User.dart';
import 'package:petstore/Services/BillDetailList.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:provider/provider.dart';

class CustomerDashboard extends StatefulWidget {
  @override
  _CustomerDashboardState createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
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
  bool cartSelected = true;
  bool accountSelected = false;
  bool logout = false;
  TextEditingController customerName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                  height: MediaQuery.of(context).size.height,
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
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Trang cá nhân',
                              style: TextStyle(
                                  fontSize: 38,
                                  decoration: TextDecoration.underline),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 50),
                                        decoration: BoxDecoration(
                                            color: Color(0xff074EEB)),
                                        child: Column(
                                          children: [
                                            CustomerOption(
                                              icon: Icons.shopping_basket,
                                              option: 'Đơn hàng',
                                              change: () {
                                                setState(() {
                                                  cartSelected = true;
                                                  accountSelected = false;
                                                  logout = false;
                                                });
                                              },
                                              isSelected: cartSelected,
                                            ),
                                            Divider(
                                              color: Color(0x00ffff),
                                              thickness: 20,
                                            ),
                                            CustomerOption(
                                              icon: Icons.account_box,
                                              option: 'Thông tin cá nhân',
                                              change: () {
                                                setState(() {
                                                  cartSelected = false;
                                                  accountSelected = true;
                                                  logout = false;
                                                });
                                              },
                                              isSelected: accountSelected,
                                            ),
                                            Divider(
                                              color: Color(0x00ffff),
                                              thickness: 20,
                                            ),
                                            CustomerOption(
                                              icon: Icons.logout,
                                              option: 'Đăng xuất',
                                              change: () {
                                                setState(() {
                                                  Provider.of<User>(context,
                                                          listen: false)
                                                      .updateName('quan');
                                                  Navigator.pushNamed(
                                                      context, '/');
                                                });
                                              },
                                              isSelected: logout,
                                            ),
                                          ],
                                        )),
                                    flex: 2,
                                  ),
                                  Expanded(child: optionBuild(context), flex: 8)
                                ],
                              ),
                            )
                          ],
                        ),
                        flex: 8,
                      ),
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

  Widget optionBuild(BuildContext context) {
    String _name = Provider.of<User>(context, listen: false).name;
    String _email = Provider.of<User>(context, listen: false).email;
    String _password = Provider.of<User>(context, listen: false).password;
    String _phone = Provider.of<User>(context, listen: false).phone;
    final _formKey = GlobalKey<FormState>();
    FocusNode _passwordNode = FocusNode();
    if (cartSelected) {
      return Consumer<BillDetailList>(
        builder: (context, value, child) => Container(
            decoration: BoxDecoration(color: Color(0xffE4E3E3)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Đơn hàng của tôi',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Table(
                      border: TableBorder.all(color: Color(0xffE4E3E3)),
                      children: [
                        TableRow(children: [
                          TableCell(
                            color: Color(0xff074EEB),
                            fontSize: 18,
                            data: 'Mã đơn hàng',
                            textColor: Colors.white,
                          ),
                          TableCell(
                              data: 'Ngày mua',
                              color: Color(0xff074EEB),
                              textColor: Colors.white,
                              fontSize: 18),
                          TableCell(
                              data: 'Sản phẩm',
                              color: Color(0xff074EEB),
                              textColor: Colors.white,
                              fontSize: 18),
                          TableCell(
                              data: 'Tổng tiền',
                              color: Color(0xff074EEB),
                              textColor: Colors.white,
                              fontSize: 18),
                          TableCell(
                              data: 'Tình trạng',
                              color: Color(0xff074EEB),
                              textColor: Colors.white,
                              fontSize: 18)
                        ]),
                        for (var i = 0; i < value.billDetails.length; i++)
                          TableRow(children: [
                            TableCell(data: '${value.billDetails[i].code}'),
                            TableCell(
                                data:
                                    '${value.billDetails[i].date.day}/${value.billDetails[i].date.month}'),
                            TableCell(data: value.billDetails[i].product),
                            TableCell(data: '${value.billDetails[i].price}'),
                            TableCell(data: value.billDetails[i].status)
                          ])
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    } else if (accountSelected) {
      return Container(
        decoration: BoxDecoration(color: Color(0xffE4E3E3)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 45),
                child: Text(
                  'Thông tin của tôi',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              Container(
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tên tài khoản',
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 20),
                          height: 30,
                          color: Colors.white,
                          child: TextFormField(
                            enabled: false,
                            controller: customerName,
                            decoration: InputDecoration(
                                hintText: _name,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0x00ffff),
                      thickness: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Mặt khẩu',
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                          width: 300,
                          color: Colors.white,
                          height: 30,
                          margin: EdgeInsets.only(left: 20),
                          child: TextFormField(
                            focusNode: _passwordNode,
                            obscureText: true,
                            controller: password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 3),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 10,
                      color: Color(0x00ffff),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                          color: Colors.white,
                          width: 300,
                          margin: EdgeInsets.only(left: 20),
                          height: 30,
                          child: TextFormField(
                            enabled: false,
                            controller: email,
                            decoration: InputDecoration(
                                hintText: _email,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0x00ffff),
                      thickness: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Phone',
                          style: TextStyle(fontSize: 21),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(left: 20),
                          color: Colors.white,
                          height: 30,
                          child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                                hintText: _phone,
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0x00ffff),
                      thickness: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(MyColor.FONTCOLOR)),
                          onPressed: () async {
                            if (password.text.length >= 8) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordNode);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));

                              await Future.delayed(Duration(seconds: 2));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Change account information complete')));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'password must be at least 8 characters long')));
                            }
                          },
                          child: Container(
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Xác nhận',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        VerticalDivider(
                          color: Color(0x00ffff),
                          thickness: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          onPressed: () => {},
                          child: Container(
                              alignment: Alignment.center,
                              child: FittedBox(
                                child: Text(
                                  'Hủy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
      );
    }
  }
}

class TableCell extends StatelessWidget {
  const TableCell(
      {Key? key,
      required this.data,
      this.color = Colors.white,
      this.fontSize = 18.0,
      this.textColor = Colors.black})
      : super(key: key);
  final String data;
  final Color color;
  final double fontSize;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(color: color),
        child: Text(
          data,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ));
  }
}

class CustomerOption extends StatefulWidget {
  CustomerOption(
      {Key? key,
      required this.option,
      required this.change,
      required this.isSelected,
      required this.icon})
      : super(key: key);
  final String option;
  final Function change;
  final isSelected;
  final IconData icon;
  @override
  _CustomerOptionState createState() => _CustomerOptionState();
}

class _CustomerOptionState extends State<CustomerOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.change();
      },
      child: Container(
        decoration:
            BoxDecoration(color: widget.isSelected ? Color(0xff003AB9) : null),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
              size: 30,
            ),
            VerticalDivider(
              thickness: 20,
            ),
            Text(widget.option,
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
