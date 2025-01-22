import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PersonalizingScreen extends StatefulWidget {
  const PersonalizingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalizingScreenState createState() => _PersonalizingScreenState();
}

class _PersonalizingScreenState extends State<PersonalizingScreen> {
  double progress = 0.5; // Set progress value (0.0 to 1.0)

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Progress Indicator with percentage
              CircularPercentIndicator(
                radius: screenWidth * 0.25, // Adjust based on screen width
                lineWidth: screenWidth * 0.03, // Adjust line width
                percent: progress,
                center: Text(
                  "${(progress * 100).toInt()}%", // Convert to percentage
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.w600,
                  ),
                ),
                progressColor: Colors.black,
                backgroundColor: Color(0xFFDCF4FF),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              SizedBox(height: screenHeight * 0.05),

              // Text Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Just a moment, we're \n personalizing your experience!",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Checklist Texts
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildChecklistItem(
                          "Setting up your screen—just a moment!", screenWidth),
                      _buildChecklistItem(
                          "Finding the perfect books for you!", screenWidth),
                      _buildChecklistItem(
                          "Sorting the top categories for you!", screenWidth),
                      _buildChecklistItem(
                          "Shaping your personalized experience!", screenWidth),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Checklist Item Widget
  Widget _buildChecklistItem(String text, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_sharp,
            color: Colors.black,
            size: screenWidth * 0.05, // Responsive icon size
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Responsive font size
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
