import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/views/cart_screen.dart';
import 'package:mega_store/views/home_screen.dart';
import 'package:mega_store/views/profile_screen.dart';

class NavigationController extends GetxController {
  Widget currentScreen = HomeScreen();
  int _navigatorBottomIndex = 0;
  get navigatorBottomIndex => _navigatorBottomIndex;

  void updateCurrentScreen(int index) {
    _navigatorBottomIndex = index;
    switch (index) {
      case 0:
        currentScreen = HomeScreen();
        break;
      case 1:
        currentScreen = CartScreen();
        break;
      case 2:
        currentScreen = ProfileScreen();
        break;
    }
    update();
  }
}
