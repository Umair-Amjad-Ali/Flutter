import 'package:flutter/material.dart';

class CustomInputFiled extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final bool isPasswordVisibility;
  final VoidCallback? toggleVisibility;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomInputFiled(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      this.isPassword = false,
      this.isPasswordVisibility = false,
      this.toggleVisibility,
      required this.keyboardType,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        SizedBox(height: screenHeight * 0.006),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? isPasswordVisibility : false,
          style: const TextStyle(color: Colors.white),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF9A6424),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisibility
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
    );
  }
}
