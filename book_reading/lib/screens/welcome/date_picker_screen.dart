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
    // Logic to calculate books per year (adjust as needed)
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Title text
              Text(
                "How much will you read each day?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // Container for Date Picker and Books Per Year
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[100], // Background color for emphasis
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Cupertino Picker for minutes
                    SizedBox(
                      height: 150,
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                            initialItem: selectedMinutes - 1),
                        itemExtent: 32.0,
                        onSelectedItemChanged: (index) {
                          int minutes =
                              index + 1; // Offset by 1 for 1-based index
                          updateBooksPerYear(minutes);
                        },
                        children: List<Widget>.generate(60, (index) {
                          return Center(
                            child: Text(
                              "${index + 1} min",
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }),
                      ),
                    ),

                    // Spacer between Picker and Books Per Year display
                    SizedBox(height: 50),

                    // Books per year display
                    Column(
                      children: [
                        Text(
                          "$booksPerYear",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          "Books per year",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Spacer to add space above the button
              SizedBox(height: 50),

              // Continue button
              ElevatedButton(
                onPressed: () {
                  // Action for the Continue button
                  print("Selected Minutes: $selectedMinutes");
                  print("Books per Year: $booksPerYear");
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
