import 'package:book_reading/screens/welcome/age_selection.dart';
import 'package:book_reading/widgets/custom_button.dart';
import 'package:book_reading/widgets/gender_option.dart';
import 'package:flutter/material.dart';

class TimeSelectionScreen extends StatefulWidget {
  const TimeSelectionScreen({super.key});

  @override
  State<TimeSelectionScreen> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<TimeSelectionScreen> {
  String? _selectedGender; // To track the selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;

        return SafeArea(
          child: Stack(
            children: [
              // Main content (centered text and options)
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.1,
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Main Heading
                      Text(
                        "What’s the best time for you to read or listen to books?",
                        style: TextStyle(
                          fontSize: screenHeight * 0.03, // Responsive font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Gender Options
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = "In the morning";
                              });
                            },
                            child: GenderOption(
                              icon: Icons.wb_sunny,
                              label: "In the morning",
                              isSelected: _selectedGender == "In the morning",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = "During lunch break";
                              });
                            },
                            child: GenderOption(
                              icon: Icons.restaurant,
                              label: "During lunch break",
                              isSelected:
                                  _selectedGender == "During lunch break",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = "In the evening";
                              });
                            },
                            child: GenderOption(
                              icon: Icons.nights_stay,
                              label: "In the evening",
                              isSelected: _selectedGender == "In the evening",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGender = "Before bedtime";
                              });
                            },
                            child: GenderOption(
                              icon: Icons.bedtime,
                              label: "Before bedtime",
                              isSelected: _selectedGender == "Before bedtime",
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Button at the bottom
              Positioned(
                bottom: screenHeight * 0.05, // Position above the bottom
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AgeSelection(),
                      ),
                    );
                    // Use _selectedGender to get the selected option
                    print("Selected Gender: $_selectedGender");
                  },
                  label: "Continue",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
