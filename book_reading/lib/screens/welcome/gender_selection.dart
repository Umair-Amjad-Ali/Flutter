import 'package:book_reading/widgets/custom_button.dart';
import 'package:book_reading/widgets/gender_option.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Main Heading
                    Text(
                      "Select Your Gender",
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
                              _selectedGender = "Male";
                            });
                          },
                          child: GenderOption(
                            icon: Icons.male,
                            label: "Male",
                            isSelected: _selectedGender == "Male",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGender = "Female";
                            });
                          },
                          child: GenderOption(
                            icon: Icons.female,
                            label: "Female",
                            isSelected: _selectedGender == "Female",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedGender = "Prefer not to say";
                            });
                          },
                          child: GenderOption(
                            icon: Icons.question_mark,
                            label: "Prefer not to say",
                            isSelected: _selectedGender == "Prefer not to say",
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Button at the bottom
              Positioned(
                bottom: screenHeight * 0.05, // Position above the bottom
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
                child: CustomButton(
                  onPressed: () {
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
