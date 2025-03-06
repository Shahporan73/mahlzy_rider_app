import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/app_images/App_images.dart';
import 'package:mahlzy_rider_app/res/common_widget/RoundTextField.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_button.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_clip_path_radius_widget.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';
import 'package:mahlzy_rider_app/res/custom_style/custom_size.dart';
import 'package:mahlzy_rider_app/res/utils/check_validation_controller.dart';
import '../controllers/login_in_controller.dart';

class LoginInView extends GetView<LoginInController> {
  LoginInView({super.key});
  final CheckValidationController validation = Get.put(CheckValidationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 18,
          ),
          Center(
            child: Image.asset(
              AppImages.splashLogo,
              height: Get.height / 6,
              width: Get.width / 2,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: ClipPath(
                clipper: CustomClipPathRadiusWidget(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.only(
                    top: Get.height / 8,
                    left: 20,
                    right: 20,
                  ),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CustomText(title: 'Welcome our lovely driver', fontSize: 15, fontWeight: FontWeight.w800,),
                        ),
                        Center(
                          child: CustomText(title: 'You are our valuable driver', fontSize: 12, fontWeight: FontWeight.w500,),
                        ),


                        heightBox20,
                        Obx(() => RoundTextField(
                            controller: validation.emailController,
                            hint: 'Enter your email or phone',
                            prefixIcon: Icon(Icons.email, size: 18,),
                            onChanged: validation.emailValidation,
                            errorText: validation.emailError.value.isEmpty?null:validation.emailError.value
                        ),),
                        heightBox10,
                        Obx(()=> RoundTextField(
                            hint: 'Password',
                            prefixIcon: Icon(Icons.lock, size: 18,),
                            suffixIcon: IconButton(
                              icon: Icon(
                                size: 18,
                                validation.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                              ),
                              onPressed: () {
                                validation.togglePasswordVisibility();
                              },
                            ),
                            obscureText: !validation.isPasswordVisible.value,
                            onChanged: validation.passwordValidation,
                            errorText: validation.passwordError.value.isEmpty?null:validation.passwordError.value
                        ),
                        ),

                        heightBox10,
                        Row(
                          children: [
                            Obx(() => Checkbox(
                              activeColor: AppColors.mainColor,
                              value: validation.isSelected.value,
                              onChanged: (bool? value) {
                                validation.isSelected.value = !validation.isSelected.value;
                              },
                            ),),
                            Text(
                              'Remember me',
                              style: TextStyle(color: Colors.black),
                            ),

                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                // Get.to(()=> ForgotPasswordView());
                              },
                              child: CustomText(
                                title: 'Forgot Password?',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        heightBox20,
                        CustomButton(
                          title: 'Sign in',
                          onTap: () {
                            if(validation.emailValidateLoginForm()){
                              //   login
                              // Get.offNamed('/dashboard');
                            }
                          },),


                        heightBox10,
                        Center(
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an account? ',
                                    style: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      // Get.to(()=>DecisionSignUpView());
                                    },
                                  ),
                                ]
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
