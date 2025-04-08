import 'package:flutter/material.dart';

class ChallengePostScreen extends StatelessWidget {
  const ChallengePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField("Challenge Name"),
                    SizedBox(height: height * 0.025),
                    _buildDropdownField("Select Category", [
                      const DropdownMenuItem(
                        value: "Fitness",
                        child: Text("Fitness"),
                      ),
                      const DropdownMenuItem(
                        value: "Diet",
                        child: Text("Diet"),
                      ),
                    ]),
                    SizedBox(height: height * 0.025),
                    _buildDropdownField("Fitness Level", [
                      const DropdownMenuItem(
                        value: "Beginner",
                        child: Text("Beginner"),
                      ),
                      const DropdownMenuItem(
                        value: "Intermediate",
                        child: Text("Intermediate"),
                      ),
                      const DropdownMenuItem(
                        value: "Advanced",
                        child: Text("Advanced"),
                      ),
                    ]),
                    SizedBox(height: height * 0.05),
                    _buildTextField("Description", maxLines: 4),
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Post",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Color(0xFF8991A0)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8991A0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.5),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
    String hint,
    List<DropdownMenuItem<String>> items,
  ) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF8991A0),
          ), // Hint text color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF8991A0), width: 1.5),
          ),
        ),
        dropdownColor: Colors.white,
        hint: Text(
          hint,
          style: const TextStyle(color: Color(0xFF8991A0)),
        ), // Hint text color
        items: items,
        onChanged: (value) {},
        style: const TextStyle(color: Color(0xFF8991A0)),
      ),
    );
  }
}
