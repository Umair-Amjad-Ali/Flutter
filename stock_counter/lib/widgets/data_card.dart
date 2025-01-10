import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.counredUnits, required this.text});

  final String counredUnits;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Text(
                counredUnits,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Add space around the text
                decoration: BoxDecoration(
                  color: const Color(0xFFEA4848),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
