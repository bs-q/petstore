import 'package:flutter/material.dart';
import 'package:petstore/Models/User.dart';
import 'package:petstore/Views/UI/Login.dart';
import 'package:petstore/Views/UI/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>User(name: 'quan'))
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet store',
      initialRoute: '/',
      routes: {'/': (context) => Home(), '/login': (context) => Login()},
    );
  }
}
