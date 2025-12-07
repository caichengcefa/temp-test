import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/login_card_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<LoginCardController>(() => LoginCardController());
  }
}
