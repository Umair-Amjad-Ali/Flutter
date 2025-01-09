import 'package:flutter/material.dart';

class DropdownCard extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final String? labelText; // Optional text to display inside the card

  const DropdownCard({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.labelText, // Optional parameter
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the labelText if provided
            if (labelText != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0), // Add spacing
                child: Text(
                  labelText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true, // Makes the dropdown expand to full width
                value: selectedValue, // Current value
                items: items
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(
                          e,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged, // Call the callback function
                hint: Text(hintText), // Customizable hint text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
