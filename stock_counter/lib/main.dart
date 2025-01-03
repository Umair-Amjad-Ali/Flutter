import 'package:flutter/material.dart';
// import 'package:stock_counter/screens/forgot_password.dart';
import 'package:stock_counter/screens/sucess.dart';
// import 'package:stock_counter/screens/signin.dart';
// import 'package:stock_counter/screens/register_sucess.dart';
// import 'package:stock_counter/screens/signup_detail.dart';

// import 'package:stock_counter/screens/role.dart';
// import 'package:stock_counter/screens/signupdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Sucess());
  }
}
