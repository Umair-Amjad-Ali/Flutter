import 'package:book_reading/screens/welcome/agree_statement.dart';
import 'package:book_reading/screens/welcome/date_picker_screen.dart';
import 'package:book_reading/screens/welcome/limited_offer_screen.dart';
import 'package:book_reading/screens/welcome/personalized_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: DatePickerScreen());
  }
}
