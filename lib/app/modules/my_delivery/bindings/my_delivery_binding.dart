import 'package:get/get.dart';

import '../controllers/my_delivery_controller.dart';

class MyDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDeliveryController>(
      () => MyDeliveryController(),
    );
  }
}
