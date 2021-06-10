import 'package:flutter/material.dart';
import 'package:petstore/Models/Product.dart';
import 'package:petstore/Models/User.dart';
import 'package:petstore/Services/CartList.dart';
import 'package:petstore/Services/ProductList.dart';
import 'package:petstore/Views/UI/Checkout.dart';
import 'package:petstore/Views/UI/EditCartPage.dart';
import 'package:petstore/Views/UI/Login.dart';
import 'package:petstore/Views/UI/PetPage.dart';
import 'package:petstore/Views/UI/ProductCategoryPage.dart';
import 'package:petstore/Views/UI/ProductPage.dart';
import 'package:petstore/Views/UI/StaffLogin.dart';
import 'package:petstore/Views/UI/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => User(name: 'ok',phone: '0387873574')),
    ChangeNotifierProvider(
        create: (context) => ProductList(products: [
              for (var i = 0; i < 8; i++)
                Product(
                    id: 1,
                    name: 'Hamster robo',
                    description:
                        "Female Roborovski Dwarf Hamsters are always up to something and are ideal if you are looking for a pet that's fun to watch, but requires less personal handling.",
                    price: 12,
                    status: true,
                    quantity: 12,
                    image: 'assets/images/rat.png')
            ])),
    ChangeNotifierProvider(
        create: (context) => CartList(products: [
              for (var i = 0; i < 8; i++)
                Product(
                    id: 1,
                    name: 'Hamster robo',
                    description:
                        "Female Roborovski Dwarf Hamsters are always up to something and are ideal if you are looking for a pet that's fun to watch, but requires less personal handling.",
                    price: 12,
                    status: true,
                    quantity: 12,
                    image: 'assets/images/rat.png')
            ])),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet store',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/staff': (context) => StaffLogin(),
        '/product': (context) => ProductPage(),
        '/pet': (context) => PetPage(),
        '/category': (context) => ProductCategoryPage(),
        '/cart': (context)=>EditCartPage(),
        '/checkout':(context)=>Checkout()
      },
    );
  }
}
