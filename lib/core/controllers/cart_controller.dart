import 'package:get/get.dart';
import 'package:mega_store/core/services/sqflite_database_helper.dart';
import 'package:mega_store/models/cart_product_model.dart';

class CartController extends GetxController {
  MegaStoreDatabaseHelper databaseHelper = MegaStoreDatabaseHelper.db;
  bool _loading = false;
  bool get loading => _loading;

  void addProduct(CartProductModel cartProduct) async {
    await databaseHelper.insert(cartProduct);
    update();
  }

  void sss() {}
}
