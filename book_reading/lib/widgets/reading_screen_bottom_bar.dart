import 'package:flutter/material.dart';

class ReadingScreenBottomBar extends StatefulWidget {
  final double screenHeight;
  final double screenWidth;
  const ReadingScreenBottomBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  State<ReadingScreenBottomBar> createState() => _ReadingScreenBottomBarState();
}

class _ReadingScreenBottomBarState extends State<ReadingScreenBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Subtle shadow
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -2), // Shadow above the bar
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 1.0, horizontal: 70.0), // Reduced vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIcon(Icons.text_fields, () {
              // Handle font settings
            }),
            _buildIcon(Icons.headphones, () {
              // Handle audio playback
            }),
            _buildIcon(Icons.list, () {
              // Handle table of contents
            }),
            _buildIcon(Icons.play_circle, () {
              // Handle playback
            }),
            _buildIcon(Icons.brightness_2, () {
              // Handle night mode toggle
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon,
          size: 22,
          color: Colors
              .grey.shade700), // Adjusted size and color for better visibility
      onPressed: onPressed,
    );
  }
}
