import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckValidationController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Error messages
  var emailError = ''.obs;
  var phoneError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  var isSelected = false.obs;


  var selectedGander = 'Male'.obs;
  var selectedVehicle = 'Walker'.obs;
  void toggleGender(String value) {
    selectedGander.value = value;
  }
  void toggleVehicle(String value) {
    selectedVehicle.value = value;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  void toggleConfirmPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Email validation
  void emailValidation(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = 'Please enter a valid email';
    } else {
      emailError.value = '';
    }
  }

// Phone validation
  void phoneValidation(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Phone number cannot be empty';
    } else if (!GetUtils.isPhoneNumber(value)) {
      phoneError.value = 'Please enter a valid phone number';
    } else {
      phoneError.value = '';
    }
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

  // Password validation
  void passwordLoginValidation(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    }else {
      passwordError.value = '';
    }
  }


// Confirm password validation
  void confirmPasswordValidation(String value) {
    if (passwordError.value.isNotEmpty) {
      confirmPasswordError.value = '';
      return;
    }

    if (value.isEmpty) {
      confirmPasswordError.value = 'Please confirm your password';
    } else if (value != passwordController.text) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

// Global validation check
  bool emailValidateForm() {
    emailValidation(emailController.text);
    passwordValidation(passwordController.text);
    confirmPasswordValidation(confirmPasswordController.text);

    return emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }

  // Global validation check
  bool phoneValidateForm() {
    phoneValidation(phoneController.text);
    passwordValidation(passwordController.text);
    confirmPasswordValidation(confirmPasswordController.text);

    return phoneError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }


// Global validation check
  bool emailValidateLoginForm() {
    emailValidation(emailController.text);
    passwordValidation(passwordController.text);

    return emailError.value.isEmpty &&
        passwordError.value.isEmpty;
  }

  // Global validation check
  bool phoneValidateLoginForm() {
    phoneValidation(phoneController.text);
    passwordValidation(passwordController.text);

    return phoneError.value.isEmpty &&
        passwordError.value.isEmpty;
  }
}
