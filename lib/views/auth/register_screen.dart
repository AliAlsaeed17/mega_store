import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/views/auth/login_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.off(LoginScreen());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomText(
                  text: "Sign Up",
                  fontSize: 30,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 25),
                CustomTextFormField(
                  text: "Full Name",
                  hintText: "Please enter your full name",
                  onSaved: (value) {
                    controller.fullName = value!;
                  },
                ),
                const SizedBox(height: 35),
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
                CustomButton(
                    text: "SIGN UP",
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        controller.emailAndPasswordSignUp();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
