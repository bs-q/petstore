import 'package:flutter/material.dart';
import 'package:petstore/Views/UI/home_header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(flex: 1, child: HomepageHeader()),
          Divider(
            color: Colors.black,
            thickness: 3,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('San pham cho cho'),
                Text('San pham cho meo'),
                Text('San pham cho vat nuoi khac'),
                Text('Vat nuoi duoc ua chuong')
              ],
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
    );
  }
}
