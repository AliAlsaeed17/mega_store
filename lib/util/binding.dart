import 'package:get/get.dart';
import 'package:mega_store/core/controllers/auth_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
