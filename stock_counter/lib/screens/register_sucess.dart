import 'package:flutter/material.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Get the screen size

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Red Circle with Check Icon
                Container(
                  height: size.width * 0.15, // Responsive height for the circle
                  width: size.width * 0.15, // Responsive width for the circle
                  decoration: const BoxDecoration(
                    color: Color(0xFFEA4848),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02), // Dynamic spacing
                // Registration Successful Text
                Text(
                  "Registration Successful!",
                  style: TextStyle(
                    fontSize: size.width * 0.05, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4D4D4D),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03), // Dynamic spacing
                // Secondary Text
                Text(
                  "Your account has been registered\nsuccessfully",
                  style: TextStyle(
                    fontSize: size.width * 0.04, // Responsive font size
                    color: const Color.fromARGB(108, 0, 0, 108),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03), // Dynamic spacing
                // Dynamic Button
                Row(
                  children: [
                    Expanded(
                      child: DynamicButton(
                        label: 'Continue',
                        onPressed: () {},
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
