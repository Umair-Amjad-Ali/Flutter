import 'package:firebase_project/views/chat/foodsloogs/food_log_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  return Future.value();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FoodLogScreen(),
    );
  }
}
