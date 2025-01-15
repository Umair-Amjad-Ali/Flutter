import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon(
      {super.key,
      required this.icon,
      required this.screenHeight,
      required this.screenWidth});

  final IconData icon;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: screenHeight * 0.025, // Responsive radius
      backgroundColor: Color(0xFFDCF4FF),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        iconSize: screenHeight * 0.025,
        onPressed: () {},
      ),
    );
  }
}
