import 'package:flutter/material.dart';
import 'package:stock_counter/screens/personal_info.dart';
import 'package:stock_counter/widgets/dynamic_button.dart';

class Sucess extends StatelessWidget {
  const Sucess({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.14, vertical: size.height * 0.1),
            child: Column(
              children: [
                const Text(
                  "Successfully",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4D4D4D),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                    "Your password has been updated, please change your password regularly to avoid this happening",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D),
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: DynamicButton(
                          label: "Continue",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalInfo()));
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
