import 'package:book_reading/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final Set<String> _selectedGoals = {}; // To track selected goals

  final List<Map<String, dynamic>> goals = [
    {"label": "Have more money"},
    {"label": "Boost Confidence"},
    {"label": "Strong Communication"},
    {"label": "Love & be loved"},
    {"label": "Psychology"},
    {"label": "Build a strong family"},
    {"label": "Improve social life"},
    {"label": "Be productive"},
    {"label": "Explore New Places"},
    {"label": "Read More Books"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main Heading
                      Text(
                        "What goals do you want to achieve?",
                        style: TextStyle(
                          fontSize: screenHeight * 0.028,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        "Pick up to 3 goals to get personalized recommendations just for you!",
                        style: TextStyle(
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                    ],
                  ),
                ),

                // Goal Options List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      final goal = goals[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_selectedGoals.contains(goal['label'])) {
                              _selectedGoals.remove(goal['label']);
                            } else if (_selectedGoals.length < 5) {
                              _selectedGoals.add(goal['label']);
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: _selectedGoals.contains(goal['label'])
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: screenWidth * 0.04,
                            ),
                            child: Text(
                              goal['label'],
                              style: TextStyle(
                                fontSize: screenHeight * 0.022,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Selected Goals Button
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.03,
                  ),
                  child: CustomButton(
                    onPressed: () {
                      // Perform your action here
                      print("Selected Goals: $_selectedGoals");
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
        },
      ),
    );
  }
}
