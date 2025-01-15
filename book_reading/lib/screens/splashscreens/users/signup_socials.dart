import 'package:flutter/material.dart';

class SignupSocials extends StatelessWidget {
  const SignupSocials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
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

                      SizedBox(height: screenHeight * 0.007), // Dynamic spacing

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

                      SizedBox(height: screenHeight * 0.01), // Dynamic spacing

                      // Subheading Text
                      Text(
                        "Sign in to get personalized recommendations just for you!",
                        style: TextStyle(
                          fontSize: screenHeight * 0.02, // Responsive font size
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: screenHeight * 0.03), // Dynamic spacing

                      // Sign up with Google
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.g_translate,
                          size: screenHeight * 0.03,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Sign up with Google",
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          minimumSize:
                              Size(screenWidth * 0.7, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Less rounded corners
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02), // Dynamic spacing

                      // Sign up with Apple
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.apple,
                          size: screenHeight * 0.03,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Sign up with Apple",
                          style: TextStyle(fontSize: screenHeight * 0.02),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          minimumSize:
                              Size(screenWidth * 0.7, screenHeight * 0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Less rounded corners
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03), // Dynamic spacing

                      // Social Icons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Facebook Icon
                          CircleAvatar(
                            radius: screenHeight * 0.025, // Responsive radius
                            backgroundColor: Color(0xFFDCF4FF),
                            child: IconButton(
                              icon: Icon(Icons.facebook, color: Colors.black),
                              iconSize: screenHeight * 0.025,
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                              width: screenWidth * 0.05), // Dynamic spacing
                          // Email Icon
                          CircleAvatar(
                            radius: screenHeight * 0.03, // Responsive radius
                            backgroundColor: Color(0xFFDCF4FF),
                            child: IconButton(
                              icon: Icon(Icons.email, color: Colors.black),
                              iconSize: screenHeight * 0.03,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.03), // Dynamic spacing

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
    );
  }
}
