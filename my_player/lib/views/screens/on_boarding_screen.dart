import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_player/views/common/elevated_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen height & width
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.7,
              width: screenWidth,
              child: Center(
                child: Image.asset(
                  'assets/cube.png',
                  height: screenHeight * 0.3, // Adjusted dynamically
                  width: screenWidth * 0.5, // Adjusted dynamically
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.3, // Takes the remaining 30% height
              width: screenWidth, // Full width
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.23, // 10% padding on sides
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Cube',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01), // Responsive spacing

                  const Text(
                    'Emmerse yourself into the world of music today',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Responsive spacing

                  // Gradient Button
                  SizedBox(
                    width: screenWidth * 0.6, // 60% of screen width
                    height: screenHeight * 0.06, // 6% of screen height
                    child: CustomElevatedButton(
                      text: "Get Started",
                      onPressed: () {
                        Get.toNamed(
                            '/SignupScreen'); // Navigate to Signup Screen
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
