import 'package:get/get.dart';
import 'package:mega_store/core/services/sqflite_database_helper.dart';
import 'package:mega_store/models/cart_product_model.dart';

class CartController extends GetxController {
  MegaStoreDatabaseHelper databaseHelper = MegaStoreDatabaseHelper.db;
  bool _loading = false;
  bool get loading => _loading;
  List<CartProductModel> _products = [];
  List<CartProductModel> get products => _products;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  CartController() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading = true;
    _products = await databaseHelper.getAllProducts();
    _loading = false;
    getTotalPrice();
  }

  void addProduct(CartProductModel cartProduct) async {
    if (products.isNotEmpty) {
      for (var product in products) {
        if (product.productID == cartProduct.productID) {
          return;
        }
      }
    }

    await databaseHelper.insert(cartProduct);
    print(cartProduct.quantity);
    getAllProducts();
  }

  getTotalPrice() {
    if (products.isNotEmpty) {
      for (var product in products) {
        _totalPrice += double.parse(product.price!) * product.quantity;
      }
    }
    update();
  }

  increaseQuantity(int index) async {
    _products[index].quantity++;
    _totalPrice += double.parse(_products[index].price!);
    await databaseHelper.update(_products[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _products[index].quantity--;
    _totalPrice -= double.parse(_products[index].price!);
    await databaseHelper.update(_products[index]);
    update();
  }
}
