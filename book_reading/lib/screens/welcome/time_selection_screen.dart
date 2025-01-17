import 'package:flutter/material.dart';

class TimeSelectionScreen extends StatefulWidget {
  const TimeSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeSelectionScreenState createState() => _TimeSelectionScreenState();
}

class _TimeSelectionScreenState extends State<TimeSelectionScreen> {
  String selectedTime = ""; // Variable to store the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                      bottom: screenHeight * 0.02,
                    ),
                    child: Text(
                      "What’s the best time for you to read or listen to books?",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Options List
                  Expanded(
                    child: ListView(
                      children: [
                        buildOption(
                          "In the morning",
                          Icons.wb_sunny,
                          "morning",
                          screenHeight,
                        ),
                        buildOption(
                          "During lunch break",
                          Icons.restaurant,
                          "lunch_break",
                          screenHeight,
                        ),
                        buildOption(
                          "In the evening",
                          Icons.nights_stay,
                          "evening",
                          screenHeight,
                        ),
                        buildOption(
                          "Before bedtime",
                          Icons.bedtime,
                          "bedtime",
                          screenHeight,
                        ),
                      ],
                    ),
                  ),

                  // Continue Button
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: selectedTime.isEmpty
                            ? null
                            : () {
                                // Handle button press
                                print("Selected Time: $selectedTime");
                              },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          backgroundColor:
                              selectedTime.isEmpty ? Colors.grey : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

  // Function to build each option
  Widget buildOption(
    String title,
    IconData icon,
    String value,
    double screenHeight,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = value;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedTime == value ? Colors.black : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: selectedTime == value ? Colors.grey.shade100 : Colors.white,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: screenHeight * 0.03,
            color: selectedTime == value ? Colors.black : Colors.grey,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: screenHeight * 0.025,
              fontWeight:
                  selectedTime == value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
