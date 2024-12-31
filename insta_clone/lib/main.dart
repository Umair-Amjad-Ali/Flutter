import 'package:flutter/material.dart';
import 'package:insta_clone/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Instagram",
      debugShowCheckedModeBanner: false,
      //  home: const Splashscreen(),
      home: SplashScreen(),
    );
  }
}
