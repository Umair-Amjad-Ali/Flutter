import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start, // Align text to the start
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }
}
