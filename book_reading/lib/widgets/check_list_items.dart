import 'package:flutter/material.dart';

class CheckListItems extends StatelessWidget {
  final String text;
  final double screenWidth;
  final double screenHeight;
  const CheckListItems(
      {super.key,
      required this.text,
      required this.screenWidth,
      required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.check, color: Color(0xFF008CFF), size: screenHeight * 0.03),
      SizedBox(width: screenWidth * 0.02),
      Expanded(
          child: Text(
        text,
        style: TextStyle(
            fontSize: screenHeight * 0.02, fontWeight: FontWeight.w400),
      ))
    ]);
  }
}
