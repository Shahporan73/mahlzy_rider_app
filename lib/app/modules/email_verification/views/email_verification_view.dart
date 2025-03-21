import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_otp_widget.dart';

import '../../../../res/app_constant/import_list.dart';
import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'Email Verification',
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.emailVerification,
                width: Get.width / 3,
                height: Get.height / 6,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              title:'Please enter the 6 digit code that was sent toxyz@gmail.com ',
              color: AppColors.mainColor,
              fontSize: 18,
              textAlign: TextAlign.center,
            ),

            heightBox50,

            CustomOtpWidget(
              borderColor: Colors.black,
              numberOfFields: 6,
              // fieldHeight: height / 15,
              fieldWidth: Get.width / 8,
            ),

            heightBox20,
            Center(
              child: CustomText(
                title: 'Resend code',
                fontWeight: FontWeight.w600,
                color: AppColors.green,
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.green,
              ),
            ),

            heightBox50,
            CustomButton(
              title: 'Verify OTP',
              onTap: () {
                Get.toNamed('/login-in');
              },
            ),


          ],
        ),
      ),
    );
  }
}
