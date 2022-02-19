import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
        items: [
          BottomNavigationBarItem(
            label: "",
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("Explore"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                "assets/images/Icon_Explore.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("Cart"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(
                "assets/images/Icon_Cart.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Account"),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                "assets/images/Icon_User.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
        currentIndex: controller.navigatorBottomIndex,
        onTap: (index) {
          controller.updateNavigatorBottomIndex(index);
        },
      ),
    );
  }
}
