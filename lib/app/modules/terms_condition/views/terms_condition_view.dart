import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_text.dart';
import 'package:mahlzy_rider_app/res/custom_style/custom_size.dart';

import '../controllers/terms_condition_controller.dart';

class TermsConditionView extends GetView<TermsConditionController> {
  const TermsConditionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'Terms and Conditions'),
      body: SingleChildScrollView(
        padding: bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomText(
              title:
              '1-Lorem ipsum dolor sit amet consectetur. '
                  'Imperdiet iaculis convallis bibendum massa id '
                  'elementum consectetur neque mauris.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            heightBox20,
            CustomText(
              title:
              '2-Lorem ipsum dolor sit amet consectetur. '
                  'Imperdiet iaculis convallis bibendum massa id '
                  'elementum consectetur neque mauris.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            heightBox20,
            CustomText(
              title:
              '3-Lorem ipsum dolor sit amet consectetur. '
                  'Imperdiet iaculis convallis bibendum massa id '
                  'elementum consectetur neque mauris.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            heightBox20,
            CustomText(
              title:
              '4-Lorem ipsum dolor sit amet consectetur. '
                  'Imperdiet iaculis convallis bibendum massa id '
                  'elementum consectetur neque mauris.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            heightBox20,
            CustomText(
              title:
              '5-Lorem ipsum dolor sit amet consectetur. '
                  'Imperdiet iaculis convallis bibendum massa id '
                  'elementum consectetur neque mauris.',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
