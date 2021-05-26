import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  int id;
  String name;
  String description;
  int price;
  bool status;
  int quantity;
  String image;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.quantity,
    required this.image
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'status': status,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      status: map['status'],
      quantity: map['quantity'],
       image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
