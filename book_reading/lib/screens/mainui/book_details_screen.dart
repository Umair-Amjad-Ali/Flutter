import 'package:book_reading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.025,
                  ),
                  Container(
                    height: screenHeight * 0.45,
                    width: screenWidth * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 4),
                        ),
                        BoxShadow(
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
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Writer name",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
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
          ],
        );
      }),
    );
  }
}
