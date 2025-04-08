import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildActionButton extends StatelessWidget {
  BuildActionButton({super.key, required this.width});

  double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("2 Likes", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.reply, size: width * 0.045, color: Colors.grey),
        ),
        Text(
          " Reply",
          style: TextStyle(
            color: const Color(0xFF8991A0),
            fontSize: width * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(Icons.thumb_up_off_alt, size: 18, color: Colors.grey),
        const SizedBox(width: 5),
        const Icon(Icons.thumb_down_off_alt, size: 18, color: Colors.grey),
      ],
    );
  }
}
