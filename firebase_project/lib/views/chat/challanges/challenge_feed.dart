import 'package:firebase_project/widgets/comment_input.dart';
import 'package:flutter/material.dart';

class ChallengeFeedScreen extends StatelessWidget {
  const ChallengeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: const AssetImage(
                                'assets/images/profile_2.png',
                              ),
                              radius: width * 0.05,
                            ),
                            SizedBox(width: width * 0.03),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Maude Hall",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  const Text(
                                    " 14 min",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Push-Up Challenge",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CategoryRow(width: width),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Do 100 push-ups in 1 minute",
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                        SizedBox(height: height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "2 Likes",
                                  style: TextStyle(
                                    color: const Color(0xFF8991A0),
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: width * 0.03),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.reply,
                                    size: width * 0.045,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  " Reply",
                                  style: TextStyle(
                                    color: const Color(0xFF8991A0),
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: width * 0.03),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF8991A0),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(width * 0.012),
                                    child: Text(
                                      "REC",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.022,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.03),
                                Text(
                                  "Accept",
                                  style: TextStyle(
                                    color: const Color(0xFF8991A0),
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: const Color(0xFF8991A0),
                                  size: width * 0.045,
                                ),
                                SizedBox(width: width * 0.02),
                                Icon(
                                  Icons.thumb_down_alt_outlined,
                                  color: const Color(0xFF8991A0),
                                  size: width * 0.045,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.01,
            ),
            child: CommentInput(width: width),
          ),
        ],
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  final double width;
  const CategoryRow({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCategoryBox("Category: Medium"),
        SizedBox(width: width * 0.03),
        _buildCategoryBox("Fitness Level: Beginner"),
      ],
    );
  }

  Widget _buildCategoryBox(String text) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3FFF4),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: width * 0.02,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xFF115740),
          fontSize: width * 0.035,
        ),
      ),
    );
  }
}
