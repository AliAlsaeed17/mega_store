import 'package:flutter/material.dart';
import 'package:mega_store/util/extenstion.dart';

class ProductModel {
  String? productID, name, description, price, size, image;
  Color? color;

  ProductModel(
      {required this.productID,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.size,
      required this.image});

  ProductModel.fromJson(Map<String, dynamic> map) {
    productID = map['productID'];
    name = map['name'];
    description = map['description'];
    price = map['price'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    image = map['image'];
  }

  toJson() {
    return {
      'productID': productID,
      'name': name,
      'description': description,
      'price': price,
      'color': color,
      'size': size,
      'image': image,
    };
  }
}
