import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/services/firebase_helper.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/models/product_model.dart';

class HomeController extends GetxController {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  bool isLoading = false;
  List<ProductModel> _bestSellingProducts = [];
  List<ProductModel> get bestSellingProducts => _bestSellingProducts;

  HomeController() {
    getCategories();
    getBestSellingProducts();
  }

  void getCategories() async {
    isLoading = true;
    _categories = await _firebaseHelper.getCategoriesFromFirestore();
    isLoading = false;
    update();
  }

  void getBestSellingProducts() async {
    isLoading = true;
    _bestSellingProducts = await _firebaseHelper.getBestSellingProducts();
    isLoading = false;
    update();
  }
}
