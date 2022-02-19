import 'package:get/get.dart';

class HomeController extends GetxController {
  int _navigatorBottomIndex = 0;
  get navigatorBottomIndex => _navigatorBottomIndex;

  void updateNavigatorBottomIndex(int index) {
    _navigatorBottomIndex = index;
    update();
  }
}
