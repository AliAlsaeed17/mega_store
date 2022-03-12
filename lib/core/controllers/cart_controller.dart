import 'package:get/get.dart';
import 'package:mega_store/core/services/sqflite_database_helper.dart';
import 'package:mega_store/models/cart_product_model.dart';

class CartController extends GetxController {
  MegaStoreDatabaseHelper databaseHelper = MegaStoreDatabaseHelper.db;
  bool _isLoadingCart = true;
  bool get isLoadingCart => _isLoadingCart;
  List<CartProductModel> _products = [];
  List<CartProductModel> get products => _products;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  bool _isCartEmpty = true;
  bool get isCartEmpty => _isCartEmpty;

  CartController() {
    getAllProducts();
  }

  getAllProducts() async {
    _products = await databaseHelper.getAllProducts();
    _isLoadingCart = false;
    if (_products.isNotEmpty) _isCartEmpty = false;
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

    if (_products[index].quantity == 0) {
      await databaseHelper.delete(_products[index]);
      _products.removeAt(index);
      if (_products.isEmpty) _isCartEmpty = true;
      update();
    } else if (_products[index].quantity >= 0) {
      await databaseHelper.update(_products[index]);
      update();
    }
  }
}
