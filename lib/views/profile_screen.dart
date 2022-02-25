import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/profile_controller.dart';
import 'package:mega_store/views/auth/login_screen.dart';
import 'package:mega_store/views/widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.find<ProfileController>(),
      builder: (controller) => Container(
        child: Center(
          child: CustomButton(
            text: 'Sign Out',
            onPressed: () {
              controller.signOut();
              Get.offAll(LoginScreen());
            },
          ),
        ),
      ),
    );
  }
}
