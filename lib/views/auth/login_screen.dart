import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/views/auth/register_screen.dart';
import 'package:mega_store/views/auth/home_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_icon_button.dart';

class LoginScreen extends GetWidget<AuthController> {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Welcome",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      child: const CustomText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: kPrimaryColor,
                      ),
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
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
                const SizedBox(height: 25),
                CustomTextFormField(
                  text: "Email",
                  hintText: "Please enter your Email",
                  onSaved: (value) {
                    controller.email = value!;
                  },
                ),
                const SizedBox(height: 35),
                CustomTextFormField(
                  text: "Password",
                  hintText: "********",
                  onSaved: (value) {
                    controller.password = value!;
                  },
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: "Forget Password",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "SIGN IN",
                  onPressed: () {
                    _formKey.currentState!.save();
                    if (_formKey.currentState!.validate()) {
                      controller.emailAndPasswordSignIn();
                    }
                  },
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                const SizedBox(height: 5),
                CustomIconButton(
                  text: "Sign In with Google",
                  imagePath: "assets/images/google.png",
                  onPressed: () {
                    controller.googleSignIn();
                  },
                ),
                CustomIconButton(
                  text: "Sign In with Facebook",
                  imagePath: "assets/images/facebook.png",
                  onPressed: () {
                    controller.facebookSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
