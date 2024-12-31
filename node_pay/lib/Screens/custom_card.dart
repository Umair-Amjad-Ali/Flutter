import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.backgroundGradient,
    this.backgroundColor,
    required this.iconContainerColor,
    required this.mainTextColor,
    required this.icon,
    required this.iconColor,
    required this.mainText,
    required this.subText,
  });

  final Gradient? backgroundGradient;
  final Color? backgroundColor;
  final Color iconContainerColor;
  final IconData icon;
  final Color iconColor;
  final String mainText;
  final Color mainTextColor;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: backgroundGradient,
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Distributes space equally
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            // First Item: Icon container
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: iconContainerColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(
                // Icons.star_border_outlined,
                icon,
                color: iconColor,
                size: 20,
              ),
            ),

            // Second Item: Text below the icon
            Text(
              mainText,
              style: TextStyle(color: mainTextColor, fontSize: 16),
            ),

            // Third Item: Row with text and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subText,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 5), // Space between text and icon
                Image.asset(
                  "assets/pngs/logo.png",
                  height: 30,
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
