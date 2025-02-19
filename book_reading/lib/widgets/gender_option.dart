import 'package:flutter/material.dart';

class GenderOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected; // To check if this option is selected
  final double screenWidth;
  final double screenHeight;

  const GenderOption({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.02,
        horizontal: screenWidth * 0.05,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 248, 245, 245), // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        border: Border.all(
          color: Colors.grey.shade300, // Border color
        ),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: Colors.black, // Inner border color
              offset: Offset(0, 0), // Shadow positioned at the center
              blurRadius: 0, // No blur
              spreadRadius: 1.0, // Border thickness
            ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: screenHeight * 0.035, color: Colors.black),
          SizedBox(width: screenWidth * 0.03),
          Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
