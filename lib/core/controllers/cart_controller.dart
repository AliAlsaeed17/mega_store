import 'package:get/get.dart';
import 'package:mega_store/core/services/sqflite_database_helper.dart';
import 'package:mega_store/models/cart_product_model.dart';

class CartController extends GetxController {
  MegaStoreDatabaseHelper databaseHelper = MegaStoreDatabaseHelper.db;
  bool _loading = false;
  bool get loading => _loading;
  List<CartProductModel> _products = [];
  List<CartProductModel> get products => _products;

  CartController() {
    getAllProducts();
  }

  void addProduct(CartProductModel cartProduct) async {
    await databaseHelper.insert(cartProduct);
    update();
  }

  getAllProducts() async {
    _loading = true;
    _products = await databaseHelper.getAllProducts();
    print(products.length);
    _loading = false;
    update();
  }
}
