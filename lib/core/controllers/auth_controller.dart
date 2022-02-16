import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
    final accessToken = result.accessToken!.token;
    if (result.status == FacebookLoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(facebookCredential);
    }
  }
}
