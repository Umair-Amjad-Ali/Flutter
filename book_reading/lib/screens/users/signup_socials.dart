import 'package:book_reading/widgets/circular_icon.dart';
import 'package:book_reading/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignupSocials extends StatelessWidget {
  const SignupSocials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return Stack(
              children: [
                // Background Image occupying 70% of the screen height
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: screenHeight * 0.6, // 70% of screen height
                    width: screenWidth, // Full screen width
                    child: Image.asset(
                      'assets/background.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Main Content
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: screenHeight *
                                0.32), // Push content below the image

                        // Logo Image
                        Image.asset(
                          'assets/headphone-background.png',
                          height: screenHeight * 0.15, // 10% of screen height
                          width: screenWidth * 0.7, // 30% of screen width
                        ),

                        SizedBox(
                            height: screenHeight * 0.007), // Dynamic spacing

                        // Main Heading
                        Text(
                          "Achieve more in less time",
                          style: TextStyle(
                            fontSize:
                                screenHeight * 0.035, // Responsive font size
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                            height: screenHeight * 0.01), // Dynamic spacing

                        // Subheading Text
                        Text(
                          "Sign in to get personalized recommendations just for you!",
                          style: TextStyle(
                            fontSize:
                                screenHeight * 0.02, // Responsive font size
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(
                            height: screenHeight * 0.03), // Dynamic spacing

                        // Sign up with Google
                        CustomButton(
                          onPressed: () {},
                          icon: Icons.g_translate,
                          label: "Sign up with Google",
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),

                        SizedBox(
                            height: screenHeight * 0.02), // Dynamic spacing

                        // Sign up with Apple
                        CustomButton(
                          onPressed: () {},
                          icon: Icons.apple,
                          label: "Sign up with Apple",
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),

                        SizedBox(
                            height: screenHeight * 0.03), // Dynamic spacing

                        // Social Icons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Facebook Icon
                            CircularIcon(
                              icon: Icons.facebook,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                            SizedBox(
                                width: screenWidth * 0.05), // Dynamic spacing
                            // Email Icon
                            CircularIcon(
                              icon: Icons.email,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),

                        SizedBox(
                            height: screenHeight * 0.03), // Dynamic spacing

                        // Already have an account text
                        GestureDetector(
                          onTap: () {
                            // Navigate to Login Screen
                          },
                          child: Text(
                            "Already have an account? Log in",
                            style: TextStyle(
                              fontSize:
                                  screenHeight * 0.018, // Responsive font size
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
