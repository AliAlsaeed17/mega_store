import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mega_store/core/services/firebase_helper.dart';
import 'package:mega_store/models/user_model.dart';
import 'package:mega_store/views/home_screen.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseHelper firebaseHelper = FirebaseHelper();

  String fullName = "", email = "", password = "";

  Rxn<User?> _user = Rxn<User?>();
  String? get userEmail => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignIn() async {
    final GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
    //print(googleAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(authCredential);
  }

  void facebookSignIn() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
    print(result);
    final accessToken = result.accessToken?.token;
    if (result.status == FacebookLoginStatus.success && accessToken != null) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(facebookCredential);
    }
  }

  void emailAndPasswordSignIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(HomeScreen()));
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void emailAndPasswordSignUp() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        await firebaseHelper.addUsertoFirestore(UserModel(
          id: user.user?.uid,
          fullName: fullName,
          email: user.user?.email,
          pic: '',
        ));
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
