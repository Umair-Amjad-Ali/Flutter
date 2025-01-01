import 'package:flutter/material.dart';
import 'package:stock_counter/screens/signup_details.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class Role extends StatelessWidget {
  const Role({super.key});

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
                Row(
                  children: [
                    Expanded(
                      child: DynamicButton(
                        label: 'Admin',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupDetails()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Shorter Button
                Row(
                  children: [
                    Expanded(
                      child: DynamicButton(
                        label: 'Shortfilter',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupDetails()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
