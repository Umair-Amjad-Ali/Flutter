import 'package:flutter/material.dart';

class SecondaryBottomNavbar extends StatelessWidget {
  final IconData icon;
  final String label;
  final double screenWidthGlobal;
  final double screenHeightGlobal;

  const SecondaryBottomNavbar({
    super.key,
    required this.icon,
    required this.label,
    required this.screenWidthGlobal,
    required this.screenHeightGlobal,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: screenHeightGlobal * 0.045,
            horizontal: screenWidthGlobal * 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Icon(
        icon,
        size: screenHeightGlobal * 0.06,
        color: Colors.white,
      ), // Corrected reference
      label: Text(label,
          style: TextStyle(
              fontSize: screenHeightGlobal * 0.045)), // Corrected reference
      onPressed: () {},
    );
  }
}
