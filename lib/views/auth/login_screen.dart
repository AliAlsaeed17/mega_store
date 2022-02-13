import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/widgets/custom_button.dart';
import 'package:mega_store/widgets/custom_icon_button.dart';
import 'package:mega_store/widgets/custom_text.dart';
import 'package:mega_store/widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: "Welcome",
                  fontSize: 30,
                ),
                CustomText(
                  text: "Sign Up",
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Sign in to continue",
              fontSize: 14,
              color: Colors.grey,
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              text: "Email",
              hintText: "Please enter your Email",
              onSaved: (value) {},
              validator: (value) {
                return "";
              },
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              text: "Password",
              hintText: "********",
              onSaved: (value) {},
              validator: (value) {
                return "";
              },
            ),
            const SizedBox(height: 20),
            const CustomText(
              text: "Forget Password",
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            const SizedBox(height: 20),
            CustomButton(text: "SIGN IN", onPressed: () {}),
            const SizedBox(height: 20),
            const CustomText(
              text: "-OR-",
              alignment: Alignment.center,
            ),
            const SizedBox(height: 40),
            CustomIconButton(
              text: "Sign In with Google",
              imagePath: "assets/images/google.png",
              onPressed: () {
                controller.googleSignIn();
              },
            ),
            const SizedBox(height: 20),
            CustomIconButton(
              text: "Sign In with Facebook",
              imagePath: "assets/images/facebook.png",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
