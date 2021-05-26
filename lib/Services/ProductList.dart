import 'package:flutter/cupertino.dart';
import 'package:petstore/Models/Product.dart';

class ProductList extends ChangeNotifier {
  List<Product> products;

  ProductList({required this.products});


}
