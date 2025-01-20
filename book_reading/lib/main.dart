import 'package:book_reading/screens/welcome/gender_selection.dart';
import 'package:book_reading/screens/welcome/time_selection_screen.dart';

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
        home: TimeSelectionScreen());
  }
}
