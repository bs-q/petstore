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
            MouseRegion(
              onEnter: (details) => {icon.incrementEnter(details, setState)},
              onHover: (details) => {icon.updateLocation(details, setState)},
              onExit: (details) => {icon.incrementExit(details, setState)},
              child: GestureDetector(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: icon.baseColor,
                  size: 32,
                ),
                onTap: () => {print('icon clicked')},
              ),
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
                    onClick: () => {print('login clicked')},
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

