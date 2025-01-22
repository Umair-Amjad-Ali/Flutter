import 'package:book_reading/screens/welcome/personalized_screen.dart';
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

  // List of container texts
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
    } else {
      // Navigate to another screen when on the last question
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const PersonalizingScreen(), // Replace with your screen
        ),
      );
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
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Main Title
                  Text("Do you agree with the statement below?",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(height: screenHeight * 0.12),

                  // Statement Card
                  Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.lightBlue.withOpacity(0.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlue.withOpacity(0.3),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.035),
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
                  SizedBox(height: screenHeight * 0.05),

                  // Yes and No Buttons
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: screenWidth * 0.05,
                        mainAxisSpacing: screenHeight * 0.02,
                        childAspectRatio: 3, // Adjusted for button consistency
                        children: [
                          AgeOption(
                            label: "Yes",
                            isSelected: _selectedYesOrNo == "Yes",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            onTap: () {
                              setState(() {
                                _selectedYesOrNo = "Yes";
                                onSelection("Yes");
                              });
                            },
                          ),
                          AgeOption(
                            label: "No",
                            isSelected: _selectedYesOrNo == "No",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            onTap: () {
                              setState(() {
                                _selectedYesOrNo = "No";
                                onSelection("No");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
