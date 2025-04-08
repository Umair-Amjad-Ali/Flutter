import 'package:firebase_project/controllers/tab_controller.dart';
import 'package:firebase_project/views/chat/foodsloogs/my_post_page.dart';
import 'package:firebase_project/views/chat/foodsloogs/public_page.dart';
import 'package:firebase_project/widgets/custom_appbar.dart';
import 'package:firebase_project/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodLogScreen extends StatelessWidget {
  const FoodLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final TabControllerX controller = Get.put(TabControllerX());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: "FoodLog"),
            Expanded(
              child: Container(
                width: width,
                height: height * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.08),
                    topRight: Radius.circular(width * 0.08),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: width * 0.065),
                    ToggleButton(
                      controller: controller,
                      labels: const ["Public", "My Post"],
                    ),
                    SizedBox(height: width * 0.05),
                    Expanded(
                      child: Obx(
                        () =>
                            controller.selectedIndex.value == 0
                                ? const PublicPage()
                                : const MyPostPage(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
