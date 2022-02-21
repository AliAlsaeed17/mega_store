import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/models/user_model.dart';

class FirebaseHelper {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");
  List<CategoryModel> _categories = [];

  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("categories");

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
}
