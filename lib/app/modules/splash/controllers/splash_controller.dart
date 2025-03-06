import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/splash/views/location_access_view.dart';

class SplashController extends GetxController {
  var logoPosition = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    animateLogo();
  }

  void animateLogo() {
    Future.delayed(const Duration(milliseconds: 500), () {
      logoPosition.value = -20.0; // Move up
      Future.delayed(const Duration(seconds: 1), () {
        logoPosition.value = 20.0; // Move down
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(()=>LocationAccessView()); // Navigate to the next screen
    });
  }
}
