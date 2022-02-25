import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/core/controllers/navigation_controller.dart';
import 'package:mega_store/views/auth/login_screen.dart';
import 'package:mega_store/views/home_screen.dart';
import 'package:mega_store/views/widgets/cutom_bottom_navigation_bar.dart';

class ControlView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().userEmail == null)
          ? LoginScreen()
          : GetBuilder<NavigationController>(
              init: Get.find<NavigationController>(),
              builder: (controller) => Scaffold(
                body: SafeArea(child: controller.currentScreen),
                bottomNavigationBar: CustomBottomNavigationBar(),
              ),
            );
    });
  }
}
