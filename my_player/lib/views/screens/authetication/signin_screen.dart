import 'package:flutter/material.dart';
import 'package:my_player/views/common/custom_input_filed.dart';
import 'package:my_player/views/common/elevated_button.dart';
import 'package:my_player/views/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.12, vertical: screenHeight * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/cube.png',
                  height: screenHeight * 0.05,
                ),
                SizedBox(height: screenHeight * 0.08),
                const Text('Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: screenHeight * 0.008),
                const Text('Already have an account?',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: screenHeight * 0.004),
                GestureDetector(
                  onTap: () {},
                  child: const Text('Sign Up',
                      style: TextStyle(
                        color: Color(0xFFE5AD45),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                ),
                SizedBox(height: screenHeight * 0.04),
                Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputFiled(
                          label: "Your Email",
                          controller: controller.emailController,
                          icon: Icons.email,
                          keyboardType: TextInputType.text,
                          validator: (value) => GetUtils.isEmail(value!)
                              ? null
                              : "Enter a valid email",
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Obx(
                          () => CustomInputFiled(
                            label: 'Your Password',
                            controller: controller.passwordController,
                            icon: Icons.key,
                            keyboardType: TextInputType.text,
                            isPassword: true,
                            hintText: "Password",
                            isPasswordVisibility:
                                controller.isPasswordVisible.value,
                            toggleVisibility:
                                controller.toggledPasswordVisibility,
                            validator: (value) {
                              if (value!.length < 8) {
                                return "Password must be at least 8 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.13),
                        Center(
                          child: SizedBox(
                            width: screenWidth * 0.6,
                            child: CustomElevatedButton(
                              text: "Get Started",
                              onPressed: () {
                                controller.validateSignUpForm();
                              },
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
