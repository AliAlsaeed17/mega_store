import 'package:get/get.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/core/controllers/home_controller.dart';
import 'package:mega_store/core/controllers/navigation_controller.dart';
import 'package:mega_store/core/controllers/profile_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => NavigationController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
