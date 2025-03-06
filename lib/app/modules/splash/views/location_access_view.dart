
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_button.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';
import 'package:mahlzy_rider_app/res/custom_style/custom_size.dart';

class LocationAccessView extends GetView {
  const LocationAccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.locationAccessImage,
              height: Get.height/ 4,
              width: Get.height / 2,
            ),

            heightBox20,
            CustomText(
                title: 'Allow location access for',
              fontSize: 18, fontWeight: FontWeight.w600,
            ),

            heightBox20,
            Container(
              width: Get.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                border: Border.all(color: AppColors.mainColor, width: 0.5),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        shape: BoxShape.circle
                      ),
                        child: Image.asset(AppImages.searchIcon, color: Colors.white, ),
                      ),
                      widthBox8,
                      Expanded(child: CustomText(title: 'Finding the best food & flowers near you',
                        fontWeight: FontWeight.w500, fontSize: 14,))
                    ],
                  ),

                  heightBox10,

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            shape: BoxShape.circle
                        ),
                        child: Image.asset(AppImages.searchIcon, color: Colors.white, ),
                      ),
                      widthBox8,
                      Expanded(child: CustomText(title: 'Quicker & Convenient delivery to your door',
                        fontWeight: FontWeight.w500, fontSize: 14,))
                    ],
                  ),
                ],
              ),
            ),


            Spacer(),
            CustomButton(title: 'Continue',
                onTap: (){
                  Get.toNamed('/login-in');
                }
            ),
            heightBox10,
            Center(
              child: Container(
                  width: Get.width / 2,
                  child: Column(
                    children: [
                      CustomText(
                        title: 'Enter location manually',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      Divider(color: Colors.black, thickness: 1, height: 2,)
                    ],
                  )
              ),
            ),



          ],
        ),
      ),
    );
  }
}
