import 'package:flutter/material.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text widget at the top
                Text(
                  'Select your role',
                  style: TextStyle(
                    fontSize: size.width * 0.07, // Dynamic font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // Admin Button
                DynamicButton(
                  label: 'Admin',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Admin selected')),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Shorter Button
                DynamicButton(
                  label: 'Shorter',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Shorter selected')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
