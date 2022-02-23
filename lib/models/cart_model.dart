import 'package:flutter/material.dart';

class CartModel {
  String? name, image, price;
  int? quantity;

  CartModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  CartModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    price = map['price'];
    image = map['image'];
    quantity = map['Quantity'];
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
