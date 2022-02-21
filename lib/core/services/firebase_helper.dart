import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_store/models/user_model.dart';

class FirebaseHelper {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("categories");

  Future<void> addUsertoFirestore(UserModel user) async {
    return await _userCollectionRef.doc(user.id).set(user.toJson());
  }

  getCategoriesFromFirestore() async {
    return await _categoryCollectionRef.get();
  }
}
