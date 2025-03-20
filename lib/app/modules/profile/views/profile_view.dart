import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/about_us/views/about_us_view.dart';
import 'package:mahlzy_rider_app/app/modules/privacy_policy/views/privacy_policy_view.dart';
import 'package:mahlzy_rider_app/app/modules/setting/views/setting_view.dart';
import 'package:mahlzy_rider_app/app/modules/terms_condition/views/terms_condition_view.dart';
import 'package:mahlzy_rider_app/app/modules/withdraw_history/views/withdraw_history_view.dart';
import 'package:mahlzy_rider_app/res/app_constant/cosnt_data.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_alert_dialog.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';

import '../../edit_profile/views/edit_profile_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Profile',
        automaticallyImplyLeading: false,
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(placeholderImage),
              ),
            ),
            heightBox10,
            Center(
              child: CustomText(
                title: 'Anna Smith',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.black,
              ),
            ),

            SizedBox(height: 20),

            _buildDrawerItem(Icons.person, 'Personal Information', onTap: () {
              Get.to(() => EditProfileView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 300));
            }),

            _buildDrawerItem(Icons.settings, 'Setting', onTap: () {
              Get.to(
                      () => SettingView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100)
              );
            }),

            _buildDrawerItem(
              Icons.payment,
              'Withdraw History',
              onTap: () {
                Get.to(
                        () => WithdrawHistoryView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 100)
                );
              },
            ),

            SizedBox(height: 20),
            // More Section
            CustomText(title: 'More'),
            _buildDrawerItem(Icons.privacy_tip, 'Privacy Policy', onTap: () {
              Get.to(() => PrivacyPolicyView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));
            }),
            _buildDrawerItem(Icons.description, 'Terms of Use', onTap: () {
              Get.to(() => TermsConditionView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));
            }),

            _buildDrawerItem(Icons.info, 'About us', onTap: () {
              Get.to(() => AboutUsView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 100));
            }),

            // Log Out
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
                size: 24,
              ),
              title: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Log Out',
                  style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
              ),
              onTap: () {
                CustomAlertDialog().customAlert(
                  context: context,
                  title: 'Log Out',
                  message: 'Are you sure you want to log out?',
                  NegativebuttonText: 'Cancel',
                  PositivvebuttonText: 'Log Out',
                  onPositiveButtonPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title,
      {VoidCallback? onTap, Color textColor = AppColors.mainColor}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 0,
          ),
          Divider(
            height: 5,
          ),
        ],
      ),
    );
  }
}
