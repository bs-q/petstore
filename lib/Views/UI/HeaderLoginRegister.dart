import 'package:flutter/material.dart';
import 'package:petstore/Models/User.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';
import 'package:petstore/Views/Utils/TextLink.dart';
import 'package:provider/provider.dart';

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
            Provider.of<User>(context).name == 'quan'
                ? NormalAccountButton(icon: icon)
                : AccountButton(icon: icon),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Consumer<User>(
                builder: (context, value, child) {
                  if (value.name == 'quan') {
                    print(value.name);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextLink(
                          customHover: login,
                          setState: setState,
                          text: 'Login',
                          onClick: () =>
                              {Navigator.pushNamed(context, '/login')},
                        ),
                        TextLink(
                          customHover: register,
                          setState: setState,
                          text: 'Register',
                          onClick: () =>
                              {Navigator.pushNamed(context, '/login')},
                        ),
                      ],
                    );
                  } else
                    return Icon(Icons.shopping_cart);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final CustomHover icon;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'order',
          child: Text('Đơn hàng'),
        ),
        const PopupMenuItem<String>(
          value: 'profile',
          child: Text('Trang hồ sơ'),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Text('Đăng xuất'),
        ),
      ],
      child: NormalAccountButton(icon: icon),
      offset: Offset(60, 40),
      onSelected: (String value) {
        if (value == 'logout') {
          Provider.of<User>(context, listen: false).updateName('quan');
        }
        print(value);
      },
    );
  }
}

class NormalAccountButton extends StatelessWidget {
  const NormalAccountButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final CustomHover icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.account_circle_outlined,
      color: icon.baseColor,
      size: 32,
    );
  }
}
