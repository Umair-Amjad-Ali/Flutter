import 'package:book_reading/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  int selectedMinutes = 20; // Default value
  int booksPerYear = 456; // Based on the default value

  void updateBooksPerYear(int minutes) {
    setState(() {
      selectedMinutes = minutes;
      booksPerYear = (minutes * 456 ~/ 20); // Example formula
    });
  }

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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Title text
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Text(
                      "How much will you read each day?",
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Container for Date Picker and Books Per Year
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Cupertino Picker for minutes
                        SizedBox(
                          height: screenHeight * 0.25,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                                initialItem: selectedMinutes - 1),
                            itemExtent: screenHeight * 0.04,
                            onSelectedItemChanged: (index) {
                              int minutes = index + 1; // Offset by 1
                              updateBooksPerYear(minutes);
                            },
                            children: List<Widget>.generate(60, (index) {
                              return Center(
                                child: Text(
                                  "${index + 1} min",
                                  style:
                                      TextStyle(fontSize: screenHeight * 0.03),
                                ),
                              );
                            }),
                          ),
                        ),

                        // Books per year display
                        SizedBox(height: screenHeight * 0.03), // Spacer
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 226, 226, 226),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "$booksPerYear",
                                style: TextStyle(
                                    fontSize: screenHeight * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              "Books per year",
                              style: TextStyle(
                                fontSize: screenHeight * 0.02,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Custom button with larger spacing
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: CustomButton(
                      onPressed: () {
                        print("Selected Minutes: $selectedMinutes");
                        print("Books per Year: $booksPerYear");
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
      ),
    );
  }
}
