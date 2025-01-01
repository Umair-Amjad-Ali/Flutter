import 'package:flutter/material.dart';
// import 'package:stock_counter/screens/role.dart';
import 'package:stock_counter/screens/signup_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignupDetails());
  }
}
