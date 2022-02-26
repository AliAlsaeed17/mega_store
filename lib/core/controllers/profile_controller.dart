import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mega_store/core/services/local_storage_helper.dart';
import 'package:mega_store/models/user_model.dart';

class ProfileController extends GetxController {
  final LocalStorageHelper localStorageHelper = LocalStorageHelper();
  late UserModel _userModel;
  UserModel get userModel => _userModel;

  @override
  void onInit() async {
    super.onInit();
    await getCurrentUser();
  }

  getCurrentUser() async {
    _userModel = await localStorageHelper.getUser;
    update();
  }

  signOut() {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageHelper.deleteUser();
  }
}
