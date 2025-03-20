// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahlzy_rider_app/app/modules/login_in/widget/forgot_sheet_screen/reset_password_sheet.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_otp_widget.dart';

import '../../../../../res/app_constant/import_list.dart';

class OtpVerifySheet extends StatelessWidget {
  const OtpVerifySheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
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
                    title: 'Enter 4 Digits Code',
                    style: GoogleFonts.rubik(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  heightBox20,
                  CustomText(
                    title: 'Enter the 6 digits code that you received on your email.',
                    style: GoogleFonts.rubik(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  heightBox20,
                  CustomOtpWidget(
                    borderColor: Colors.black,
                    numberOfFields: 6,
                    // fieldHeight: height / 15,
                    fieldWidth: width / 8,
                  ),
                  heightBox20,
                  CustomButton(
                    title: 'Verify OTP',
                    onTap: (){
                      Navigator.pop(context);

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (_) => ResetPasswordSheet(),
                      );

                      Get.rawSnackbar(
                        message: 'OTP verified successfully',
                        backgroundColor: Colors.green,
                        snackPosition: SnackPosition.TOP,
                      );
                    },
                  ),
                ]
            ),
          ),
        );
      },
    );
  }
}

