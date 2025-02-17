import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_player/views/routes/app_pages.dart';
import 'package:my_player/views/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Player",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreen,
      getPages: AppPages.pages,
    );
  }
}
