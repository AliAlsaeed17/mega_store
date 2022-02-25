import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mega_store/core/services/local_storage_helper.dart';

class ProfileController extends GetxController {
  final LocalStorageHelper localStorageHelper = LocalStorageHelper();
  signOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageHelper.deleteUser();
  }
}
