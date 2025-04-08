import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.12;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.25,
      ),
      width: width,
      height: height,
      color: Colors.black,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: width * 0.05,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: width * 0.05,
              ),
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: width * 0.1),
        ],
      ),
    );
  }
}
