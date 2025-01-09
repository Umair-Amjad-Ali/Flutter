import 'package:flutter/material.dart';

class DropdownCard extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;

  const DropdownCard({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width:
            double.infinity, // Ensures the container takes full available width
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          // Removes the underline
          child: DropdownButton<String>(
            isExpanded: true, // Makes the dropdown expand to full width
            value: selectedValue, // Current value
            items: items
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged: onChanged, // Call the callback function
            hint: Text(hintText), // Customizable hint text
          ),
        ),
      ),
    );
  }
}
