import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar("Success", "Account Created Successfully!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    }
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151515), // Dark background
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Image.asset(
                  'assets/cube.png',
                  height: screenHeight * 0.07,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Sign Up Text
                const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/login'); // Navigate to login
                  },
                  child: const Text(
                    "Sign IN",
                    style: TextStyle(
                      color: Color(0xFFE5AD45),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Form Section
                Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInputField(
                        label: "Your Name",
                        controller: controller.nameController,
                        icon: Icons.person,
                        validator: (value) {
                          if (value!.isEmpty) return "Name is required";
                          return null;
                        },
                      ),
                      buildInputField(
                        label: "Your Email",
                        controller: controller.emailController,
                        icon: Icons.email,
                        validator: (value) {
                          if (!GetUtils.isEmail(value!)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      Obx(() => buildInputField(
                            label: "Your Password",
                            controller: controller.passwordController,
                            icon: Icons.key,
                            isPassword: true,
                            isPasswordVisible:
                                controller.isPasswordVisible.value,
                            toggleVisibility:
                                controller.togglePasswordVisibility,
                            validator: (value) {
                              if (value!.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          )),
                      Obx(() => buildInputField(
                            label: "Confirm Password",
                            controller: controller.confirmPasswordController,
                            icon: Icons.key,
                            isPassword: true,
                            isPasswordVisible:
                                controller.isConfirmPasswordVisible.value,
                            toggleVisibility:
                                controller.toggleConfirmPasswordVisibility,
                            validator: (value) {
                              if (value != controller.passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          )),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Signup Button
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.validateForm();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9A6424), Color(0xFFE5AD45)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015),
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable Input Field Widget
  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? toggleVisibility,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            obscureText: isPassword ? !isPasswordVisible : false,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF9A6424), // Brownish input field
              prefixIcon: Icon(icon, color: Colors.white),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white,
                      ),
                      onPressed: toggleVisibility,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
