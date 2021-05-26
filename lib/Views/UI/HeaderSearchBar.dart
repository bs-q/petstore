import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';

class HeaderSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
                flex: 9,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 7, vertical: 3)),
                )),
            Container(
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyColor.FONTCOLOR)),
                    onPressed: () =>
                        {Navigator.pushNamed(context, '/category')},
                    child: Row(
                      children: [Icon(Icons.search), Text('Tim kiem')],
                    )),
              ),
            )
          ],
        ));
  }
}
