import 'package:book_reading/widgets/check_list_items.dart';
import 'package:book_reading/widgets/custom_appbar.dart';
import 'package:book_reading/widgets/secondary_bottom_navbar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final List<String> learningPoints = [
    "How can you observe without judging.",
    "How do you express true feelings.",
    "What’s the best way to state your needs.",
    "How does empathy improve communication.",
    "How does self-empathy help you.",
    "How do you build respect in talks.",
    "How can you handle tension calmly.",
    "How do you strengthen relationships."
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidthGlobal = MediaQuery.of(context).size.width;
    var screenHeightGlobal = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.025,
                        ),
                        Container(
                          height: screenHeight * 0.42,
                          width: screenWidth * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 4),
                              ),
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: -2,
                                offset: Offset(0, -4),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        Text(
                          "Book Title",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Text(
                          "Writer name",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.build_circle_outlined,
                                    color: Color(0xFF8D8D8D), size: 15),
                                Text(" 8 key points")
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            Row(
                              children: [
                                Icon(Icons.lock_clock,
                                    color: Color(0xFF8D8D8D), size: 15),
                                Text(" 20 Min")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.02,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8D8D8D),
                          width: .2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "YOU'LL LEARN",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Column(
                          children: learningPoints
                              .map((point) => CheckListItems(
                                  text: point,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight))
                              .toList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidthGlobal * 0.025,
            vertical: screenHeightGlobal * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SecondaryBottomNavbar(
                icon: Icons.book,
                label: "Read",
                screenWidthGlobal: screenWidthGlobal,
                screenHeightGlobal: screenHeightGlobal),
            SecondaryBottomNavbar(
                icon: Icons.headphones,
                label: "Listen",
                screenWidthGlobal: screenWidthGlobal,
                screenHeightGlobal: screenHeightGlobal),
            SecondaryBottomNavbar(
                icon: Icons.play_circle,
                label: "Watch",
                screenWidthGlobal: screenWidthGlobal,
                screenHeightGlobal: screenHeightGlobal),
          ],
        ),
      ),
    );
  }
}
