import 'package:flutter/material.dart';

class CalculatedCard extends StatelessWidget {
  const CalculatedCard(
      {super.key, required this.headText, required this.calculatedText});

  final String headText;
  final String calculatedText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top text with background color
            Container(
              width: double.infinity, // Ensures full width
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEA4848),
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                headText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20), // Space between texts
            Text(
              calculatedText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
