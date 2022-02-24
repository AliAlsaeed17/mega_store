import 'package:flutter/material.dart';

class CartProductModel {
  String? name, image, price;
  int? quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
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
