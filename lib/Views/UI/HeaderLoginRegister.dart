import 'package:flutter/material.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:petstore/Views/Utils/TextLink.dart';

class HeaderLoginRegister extends StatefulWidget {
  @override
  _HeaderLoginRegisterState createState() => _HeaderLoginRegisterState();
}

class _HeaderLoginRegisterState extends State<HeaderLoginRegister> {
  CustomHover login = CustomHover();
  CustomHover register = CustomHover();
  CustomHover icon = CustomHover();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Value1',
                  child: Text('Choose value 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Value2',
                  child: Text('Choose value 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Value3',
                  child: Text('Choose value 3'),
                ),
              ],
              child: Icon(
                Icons.account_circle_outlined,
                color: icon.baseColor,
                size: 32,
              ),
              offset: Offset(60, 40),
              onSelected: (String value) => {print(value)},
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextLink(
                    customHover: login,
                    setState: setState,
                    text: 'Login',
                    onClick: () => {Navigator.pushNamed(context, '/login')},
                  ),
                  TextLink(
                    customHover: register,
                    setState: setState,
                    text: 'Register',
                    onClick: () => {print('register cliked')},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
