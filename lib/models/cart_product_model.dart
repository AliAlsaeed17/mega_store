import 'package:flutter/material.dart';

class CartProductModel {
  String? productID, name, image, price;
  int quantity = 1;

  CartProductModel({
    required this.productID,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    productID = map['productID'];
    name = map['name'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'productID': productID,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
