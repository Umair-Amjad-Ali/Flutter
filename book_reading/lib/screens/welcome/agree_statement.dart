import 'package:book_reading/widgets/age_option.dart';
import 'package:flutter/material.dart';

class AgreeStatementScreen extends StatefulWidget {
  const AgreeStatementScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgreeStatementScreenState createState() => _AgreeStatementScreenState();
}

class _AgreeStatementScreenState extends State<AgreeStatementScreen> {
  String? _selectedYesOrNo;
  // List of container textsa
  final List<String> containerTexts = [
    "Do you find it hard to stay focused on your goals?",
    "Are you feeling stuck and unsure about your next steps?",
    "Do you feel nervous or unconfident speaking in front of a crowd?",
  ];

  int currentIndex = 0; // Current index in the containerTexts list

  void onSelection(String answer) {
    if (currentIndex < containerTexts.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Main Title
                  Column(
                    children: [
                      Text(
                        "Do you agree with the statement below?",
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  ),

                  // Statement Container
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Text(
                        containerTexts[currentIndex],
                        style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // Yes and No Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // No Button

                      AgeOption(
                          label: "No",
                          isSelected: _selectedYesOrNo == "No",
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          onTap: () {})

                      // Yes Button
                    ],
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
