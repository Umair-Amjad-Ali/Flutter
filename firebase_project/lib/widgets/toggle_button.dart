import 'package:firebase_project/controllers/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleButton extends StatelessWidget {
  final TabControllerX controller;
  final List<String> labels;

  const ToggleButton({
    super.key,
    required this.controller,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Obx(
        () => Row(
          children: List.generate(
            labels.length,
            (index) => Expanded(
              child: GestureDetector(
                onTap: () => controller.selectedIndex.value = index,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: width * 0.03),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedIndex.value == index
                            ? Colors.black
                            : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          index == 0 ? const Radius.circular(5) : Radius.zero,
                      bottomLeft:
                          index == 0 ? const Radius.circular(5) : Radius.zero,
                      topRight:
                          index == 1 ? const Radius.circular(5) : Radius.zero,
                      bottomRight:
                          index == 1 ? const Radius.circular(5) : Radius.zero,
                    ),
                  ),
                  child: Text(
                    labels[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          controller.selectedIndex.value == index
                              ? Colors.white
                              : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.0377,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
