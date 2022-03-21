import 'package:mega_store/models/cart_product_model.dart';

class OrderModel {
  String? userID, dateTime;
  Address? address;
  List<CartProductModel>? products;
}

class Address {
  String? street1, street2, city, state, country;

  Address({this.street1, this.street2, this.city, this.state, this.country});

  Address.fromJson(Map<String, dynamic> map) {
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
  }

  toJson() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
