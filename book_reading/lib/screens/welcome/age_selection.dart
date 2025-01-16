import 'package:book_reading/widgets/custom_button.dart';
import 'package:book_reading/widgets/age_option.dart';
import 'package:flutter/material.dart';

class AgeSelection extends StatefulWidget {
  const AgeSelection({super.key});

  @override
  State<AgeSelection> createState() => _AgeSelectionState();
}

class _AgeSelectionState extends State<AgeSelection> {
  String? _selectedAge; // To track the selected age group

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;

        return SafeArea(
          child: Column(
            children: [
              // Spacer for top alignment
              Spacer(),
              // Main Heading
              Text(
                "How old are you?",
                style: TextStyle(
                  fontSize: screenHeight * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: screenHeight * 0.03),

              // Age Options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: GridView.count(
                  shrinkWrap: true, // Ensures it takes only required height
                  crossAxisCount: 2, // 2 options in each row
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: 2.5, // Aspect ratio of each item
                  children: [
                    AgeOption(
                      label: "12-29",
                      isSelected: _selectedAge == "12-29",
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        setState(() {
                          _selectedAge = "12-29";
                        });
                      },
                    ),
                    AgeOption(
                      label: "30-39",
                      isSelected: _selectedAge == "30-39",
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        setState(() {
                          _selectedAge = "30-39";
                        });
                      },
                    ),
                    AgeOption(
                      label: "40-49",
                      isSelected: _selectedAge == "40-49",
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        setState(() {
                          _selectedAge = "40-49";
                        });
                      },
                    ),
                    AgeOption(
                      label: "50+",
                      isSelected: _selectedAge == "50+",
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onTap: () {
                        setState(() {
                          _selectedAge = "50+";
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Spacer for bottom alignment
              Spacer(),

              // Button at the bottom
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: CustomButton(
                  onPressed: () {
                    // Use _selectedAge to get the selected option
                    print("Selected Age Group: $_selectedAge");
                  },
                  label: "Continue",
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        );
      }),
    );
  }
}
