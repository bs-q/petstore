import 'package:flutter/material.dart';
import 'package:petstore/Views/UI/HeaderLoginRegister.dart';
import 'package:petstore/Views/UI/HeaderSearchBar.dart';

class HomepageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/'),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
      ),
      Expanded(
        child: HeaderSearchBar(),
        flex: 9,
      ),
      Expanded(
        flex: 2,
        child: HeaderLoginRegister(),
      )
    ]);
  }
}
