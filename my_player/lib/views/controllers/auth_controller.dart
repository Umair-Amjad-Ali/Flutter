import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  final formKey = GlobalKey<FormState>();

  void toggledPasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value; // Fix here
  }

  void toggledConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void validateSignUpForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Account Created Successfully!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    }
  }

  void validateSignInForm() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please enter email and password",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Error", "Enter a valid email",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }
    Get.snackbar("Success", "Login Successful!",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
  }
}
