import 'package:flutter/material.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.1),
          child: Column(
            children: [
              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4D4D4D),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter your Email address to receive a password reser link",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4D4D4D),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Form(
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    hintText: "Email",
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!emailRegex.hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: DynamicButton(
                          label: "Send Reset Link", onPressed: () {}))
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember Password? ",
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffEA4848),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
