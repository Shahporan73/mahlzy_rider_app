
import '../../../../res/app_constant/import_list.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});


  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Obx(
              () => AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            transform: Matrix4.translationValues(0, controller.logoPosition.value, 0),
            child: Image.asset(
              AppImages.splashLogo,
              height: Get.height / 3,
              width: Get.width / 2,
            ),
          ),
        ),
      ),
    );
  }
}
