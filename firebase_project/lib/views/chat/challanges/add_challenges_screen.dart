import 'package:firebase_project/controllers/tab_controller.dart';
import 'package:firebase_project/views/chat/challanges/challenge_feed.dart';
import 'package:firebase_project/views/chat/challanges/challenge_post.dart';
import 'package:firebase_project/widgets/custom_appbar.dart';
import 'package:firebase_project/widgets/toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChallengesScreen extends StatelessWidget {
  const AddChallengesScreen({super.key});

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
            Obx(
              () => CustomAppBar(
                title:
                    controller.selectedIndex.value == 0
                        ? "Challenges"
                        : "Add Challenges",
              ),
            ),
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
                    SizedBox(height: width * 0.05),
                    ToggleButton(
                      controller: controller,
                      labels: const ["View", "Add"],
                    ),
                    SizedBox(height: width * 0.05),
                    Expanded(
                      child: Obx(
                        () =>
                            controller.selectedIndex.value == 0
                                ? const ChallengeFeedScreen()
                                : const ChallengePostScreen(),
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
