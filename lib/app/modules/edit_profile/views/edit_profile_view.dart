import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/res/app_constant/cosnt_data.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/app_images/App_images.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_network_image_widget.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Image Picker
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(placeholderImage),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: GestureDetector(
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.mainColor,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            heightBox30,
            RoundTextField(
                hint: 'Name'
            ),
            heightBox10,
            RoundTextField(
                hint: 'Country'
            ),
            heightBox10,
            RoundTextField(
                hint: 'example@gmail.com'
            ),
            heightBox10,
            RoundTextField(
                hint: 'Number'
            ),

            heightBox30,
            CustomButton(
                title: 'Save Change',
                onTap: () {}
            ),

          ],
        ),
      ),
    );
  }
}
