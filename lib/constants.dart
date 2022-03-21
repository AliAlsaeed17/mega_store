import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(0, 197, 105, 1);

const String cartTableName = "CartTable";
const String productIDColumn = "productID";
const String productNameColumn = "name";
const String productImageColumn = "image";
const String productQuantityColumn = "quantity";
const String productPriceColumn = "price";

const cachedUserData = 'chchedUserData';

const kTileHeight = 50.0;
const inProgressColor = Colors.grey;
const todoColor = Color(0xffd1d2d7);

const checkoutProcess = [
  {'order': 0, 'step': 'delevery'},
  {'order': 1, 'step': 'add address'},
  {'order': 2, 'step': 'summary'},
];

enum CheckoutPages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum DeliveryModes {
  StandardDelivey,
  NextDayDelivey,
  NominatedDelivey,
}
