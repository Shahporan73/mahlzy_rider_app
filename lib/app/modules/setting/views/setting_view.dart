import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/setting/views/change_password_view.dart';
import 'package:mahlzy_rider_app/res/app_color/app_colors.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_alert_dialog.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: "Settings",
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: CustomText(
                    title: "Change Password",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black
                ),
                trailing: Icon(Icons.navigate_next, color: AppColors.black,),
                leading: Icon(Icons.settings_outlined),
                onTap: () {
                  Get.to(
                        () => ChangePasswordView(),
                    fullscreenDialog: true,
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 100),
                  );
                },
              ),

              ListTile(
                title: CustomText(
                    title: "Delete Account",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.red
                ),
                leading: Icon(Icons.delete_outline, color: Colors.red,),
                onTap: () {
                  CustomAlertDialog().showDeleteAccountDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
