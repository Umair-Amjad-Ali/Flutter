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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.35, // Dynamic width padding
          vertical: size.height * 0.02, // Dynamic height padding
        ),
        backgroundColor: const Color(0xFFEA4848),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: size.width * 0.05, color: Colors.white),
        // Dynamic font size
      ),
    );
  }
}
