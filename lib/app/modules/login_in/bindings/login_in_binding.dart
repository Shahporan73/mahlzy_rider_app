import 'package:get/get.dart';

import '../controllers/login_in_controller.dart';

class LoginInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginInController>(
      () => LoginInController(),
    );
  }
}
