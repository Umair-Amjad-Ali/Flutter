import 'package:book_reading/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LimitedOfferScreen extends StatelessWidget {
  const LimitedOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FEFF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Close button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.close, size: screenWidth * 0.06),
                      onPressed: () {
                        // Handle close action
                      },
                    ),
                  ),

                  // Image in the center of the screen
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image
                        Image.asset(
                          'assets/offer.png', // Replace with your image path
                          height: screenHeight * 0.25, // Responsive height
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: screenHeight * 0.03),

                        // Main content
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "87",
                                    style: TextStyle(
                                        fontSize: screenHeight *
                                            0.07, // Responsive font size
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF0000)),
                                  ),
                                  TextSpan(
                                    text: "% OFF",
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Get Premimum at ",
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "22,600 PKR ",
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      decoration: TextDecoration
                                          .lineThrough, // Strikethrough effect
                                      decorationColor:
                                          Colors.black, // Matches text color
                                      decorationThickness:
                                          1.5, // Adjust the thickness of the line
                                      height:
                                          1.2, // Ensures proper alignment of the line
                                    ),
                                  ),
                                  TextSpan(
                                    text: " 2,750 PKR",
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.025,
                                      fontWeight: FontWeight.w600,
                                      color: Colors
                                          .red, // Red color for the discounted price
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\nfor your first year!",
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.02,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              "24:00:00",
                              style: TextStyle(
                                fontSize: screenHeight * 0.025,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            CustomButton(
                                onPressed: () {},
                                label: "Subscribe Now",
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                screenWidth: screenWidth,
                                screenHeight: screenHeight)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
