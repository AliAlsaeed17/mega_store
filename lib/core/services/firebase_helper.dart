import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mega_store/models/user_model.dart';

class FirebaseHelper {
  CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("users");

  Future<void> addUsertoFirestore(UserModel user) async {
    return await _userCollectionRef.doc(user.id).set(user.toJson());
  }
}
