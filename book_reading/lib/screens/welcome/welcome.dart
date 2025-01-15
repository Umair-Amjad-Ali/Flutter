import 'package:book_reading/screens/welcome/gender_selection.dart';
import 'package:book_reading/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth;

          return SafeArea(
            child: Stack(
              children: [
                // Main Content
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image at the top center
                      Image.asset(
                        'assets/person.png', // Replace with your image path
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),

                      Text(
                        "Welcome to ReadPro, Ihsan!",
                        style: TextStyle(
                          fontSize:
                              screenHeight * 0.035, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      // Subheading Text with smaller padding
                      Text(
                        "Let's find your interests for personalized recommendations!",
                        style: TextStyle(
                          fontSize: screenHeight * 0.02, // Responsive font size
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Button at the bottom center
                Positioned(
                  bottom:
                      screenHeight * 0.05, // 5% above the bottom of the screen
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GenderSelection(),
                          ),
                        );
                      },
                      label: "Get Started",
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
