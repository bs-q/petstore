import 'package:flutter/material.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

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
                  color: icon.textColor,
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
                  MouseRegion(
                    onEnter: (details) =>
                        {login.incrementEnter(details, setState)},
                    onHover: (details) =>
                        {login.updateLocation(details, setState)},
                    onExit: (details) =>
                        {login.incrementExit(details, setState)},
                    child: GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(color: login.textColor),
                      ),
                      onTap: () => {print('login clicked')},
                    ),
                  ),
                  MouseRegion(
                    onEnter: (details) =>
                        {register.incrementEnter(details, setState)},
                    onHover: (details) =>
                        {register.updateLocation(details, setState)},
                    onExit: (details) =>
                        {register.incrementExit(details, setState)},
                    child: GestureDetector(
                        child: Text(
                          'Register',
                          style: TextStyle(color: register.textColor),
                        ),
                        onTap: () => {print('Register clicked')}),
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
