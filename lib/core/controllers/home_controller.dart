import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/services/firebase_helper.dart';
import 'package:mega_store/models/category_model.dart';

class HomeController extends GetxController {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  bool isLoading = false;

  HomeController() {
    getCategories();
  }

  void getCategories() async {
    isLoading = true;
    _categories = await _firebaseHelper.getCategoriesFromFirestore();
    isLoading = false;
    update();
  }
}
