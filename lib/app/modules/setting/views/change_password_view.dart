import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mahlzy_rider_app/app/modules/setting/controllers/change_password_controller.dart';
import 'package:mahlzy_rider_app/res/common_widget/RoundTextField.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_app_bar.dart';
import 'package:mahlzy_rider_app/res/common_widget/custom_button.dart';
import 'package:mahlzy_rider_app/res/custom_style/custom_size.dart';

class ChangePasswordView extends GetView {
  ChangePasswordView({super.key});
  // Get.put(ChangePasswordController());
  final controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => ChangePasswordController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Change Password'),
      body: SingleChildScrollView(
        padding: bodyPadding,
        child: Obx(
          () => Column(
            children: [
              RoundTextField(
                  hint: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      controller.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                  ),
                  obscureText: !controller.isPasswordVisible.value,
                  onChanged: controller.passwordValidation,
                  errorText: controller.passwordError.value.isEmpty
                      ? null
                      : controller.passwordError.value),
              heightBox10,
              RoundTextField(
                  hint: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      controller.isNewPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.toggleNewPasswordVisibility();
                    },
                  ),
                  obscureText: !controller.isNewPasswordVisible.value,
                  onChanged: controller.newPasswordValidation,
                  errorText: controller.newPasswordError.value.isEmpty
                      ? null
                      : controller.newPasswordError.value),
              heightBox10,
              RoundTextField(
                  hint: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      size: 18,
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                  ),
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  onChanged: controller.confirmPasswordValidation,
                  errorText: controller.confirmPasswordError.value.isEmpty
                      ? null
                      : controller.confirmPasswordError.value),
              heightBox20,
              CustomButton(
                title: 'Change',
                onTap: () {
                  if (controller.validateForm()) {
                    Navigator.pop(context);
                    Get.rawSnackbar(
                        message: 'Password updated successfully',
                        backgroundColor: Colors.green,
                        snackPosition: SnackPosition.BOTTOM);
                  } else {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
