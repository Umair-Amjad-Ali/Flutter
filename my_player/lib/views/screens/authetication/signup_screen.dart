import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: const Text('Sign IN',
                      style: TextStyle(
                        color: Color(0xFFE5AD45),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
