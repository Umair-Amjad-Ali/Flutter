import 'package:flutter/material.dart';

// Reusable Dynamic Button Widget
class DynamicButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DynamicButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.086, // Dynamic height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEA4848),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: size.width * 0.04, color: Colors.white),
          // Dynamic font size
        ),
      ),
    );
  }
}
