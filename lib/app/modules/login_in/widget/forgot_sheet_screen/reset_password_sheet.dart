// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

class ResetPasswordSheet extends StatelessWidget {
  ResetPasswordSheet({super.key});

  final CheckValidationController validation = Get.put(CheckValidationController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightBox10,
                  CustomText(
                    title: 'Reset Password',
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  heightBox20,
                  CustomText(
                    title: 'Set the new password for your account so you can login and access all the features.',
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  heightBox20,
                  RoundTextField(
                    hint: 'New Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    controller: validation.passwordController,
                    obscureText: validation.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(validation.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility),
                      color: AppColors.black,
                      onPressed: validation.togglePasswordVisibility,
                    ),
                  ),
                  heightBox20,
                  RoundTextField(
                    hint: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    controller: validation.confirmPasswordController,
                    obscureText: validation.isConfirmPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(validation.isConfirmPasswordVisible.value ? Icons.visibility_off : Icons.visibility),
                      color: AppColors.black,
                      onPressed: validation.toggleConfirmPasswordVisibility,
                    ),
                  ),
                  heightBox20,
                  CustomButton(
                    title: 'Verify OTP',
                    onTap: (){
                      Navigator.pop(context);
                      Get.rawSnackbar(
                        message: 'Password Reset Successfully',
                        backgroundColor: AppColors.mainColor,
                      );
                    },
                  ),
                ]
            ),
          ),
        ),);
      },
    );
  }
}

