import 'package:flutter/cupertino.dart';
import 'package:petstore/Models/Product.dart';

class CartList extends ChangeNotifier {
  List<Product> products;

  CartList({required this.products});

  void decreaseQuantity(int index) {
    if (products.elementAt(index).quantity > 1) {
      products[index].quantity--;
      notifyListeners();
    }
  }

  void increaseQuantity(int index) {
    products[index].quantity++;
    notifyListeners();
  }

  void removeItem(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  int getTotal() {
    return products.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.quantity);
  }

  void updateQuantity(int index, int value) {
    products[index].quantity = value;
    notifyListeners();
  }
}
