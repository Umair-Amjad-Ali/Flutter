import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double screenWidth;
  final double screenHeight;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null
          ? Icon(
              icon,
              size: screenHeight * 0.03,
              color: textColor,
            )
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: TextStyle(
          fontSize: screenHeight * 0.02,
          color: textColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
