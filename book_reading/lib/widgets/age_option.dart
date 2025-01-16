import 'package:flutter/material.dart';

class AgeOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;

  const AgeOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.001),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.05,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 236, 239, 240)
              : Colors.grey[200],
          border: Border.all(
            color: isSelected
                ? const Color.fromARGB(255, 16, 16, 16)
                : Colors.transparent,
            width: isSelected ? 1.0 : 0.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
