import 'package:get/get.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/core/controllers/home_controller.dart';
import 'package:mega_store/core/controllers/navigation_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
