import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var isSelected = false.obs;
  var isPasswordVisible = false.obs;
  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  var passwordError = ''.obs;
  var newPasswordError = ''.obs;
  var confirmPasswordError = ''.obs;

  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }
  toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Password validation
  void passwordValidation(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 8 || value.length > 15) {
      passwordError.value = 'Password must be 8-15 characters long';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,15}$').hasMatch(value)) {
      passwordError.value = 'Invalid password format';
    } else {
      passwordError.value = '';
    }
  }

  // New Password validation
  void newPasswordValidation(String value) {
    if (value.isEmpty) {
      newPasswordError.value = 'Password cannot be empty';
    } else if (value.length < 8 || value.length > 15) {
      newPasswordError.value = 'Password must be 8-15 characters long';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,15}$').hasMatch(value)) {
      newPasswordError.value = 'Invalid password format';
    } else {
      newPasswordError.value = '';
    }
  }

  // Confirm Password validation
  void confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'Password cannot be empty';
    } else if (value.length < 8 || value.length > 15) {
      confirmPasswordError.value = 'Password must be 8-15 characters long';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,15}$').hasMatch(value)) {
      confirmPasswordError.value = 'Invalid password format';
    } else {
      confirmPasswordError.value = '';
    }
  }

  // Global validation check
  bool validateForm() {
    passwordValidation(oldPasswordController.text);
    newPasswordValidation(newPasswordController.text);
    confirmPasswordValidation(confirmPasswordController.text);

    return passwordError.value.isEmpty &&
        newPasswordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }
}