import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/models/user_model.dart';

class FirebaseHelper {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("categories");

  List<CategoryModel> _categories = [];

  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection("products");

  List<ProductModel> _bestSellingProducts = [];

  Future<void> addUsertoFirestore(UserModel user) async {
    return await _userCollectionRef.doc(user.id).set(user.toJson());
  }

  Future<List<CategoryModel>> getCategoriesFromFirestore() async {
    await _categoryCollectionRef.get().then((snapshot) {
      snapshot.docs.forEach((document) {
        _categories.add(
            CategoryModel.fromJson(document.data() as Map<String, dynamic>));
      });
    });
    return _categories;
  }

  Future<List<ProductModel>> getBestSellingProducts() async {
    await _productCollectionRef.get().then((snapshot) {
      snapshot.docs.forEach((document) {
        _bestSellingProducts.add(
            ProductModel.fromJson(document.data() as Map<String, dynamic>));
      });
    });
    return _bestSellingProducts;
  }

  Future<UserModel> getCurrentUser(String userID) async {
    var userDocument = await _userCollectionRef.doc(userID).get();
    return UserModel.fromJson(userDocument.data() as Map<dynamic, dynamic>);
  }
}
