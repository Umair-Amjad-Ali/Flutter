import 'package:firebase_project/utils/models/post_data_model.dart';
import 'package:firebase_project/utils/post_dummy_data.dart';
import 'package:firebase_project/widgets/build_action_button.dart';
import 'package:firebase_project/widgets/comment_input.dart';
import 'package:flutter/material.dart';

class MyPostPage extends StatelessWidget {
  const MyPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: ListView(
              children:
                  dummyPosts.map((post) => _buildPost(width, post)).toList(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: CommentInput(width: width),
        ),
      ],
    );
  }

  Widget _buildPost(double width, Post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPostHeader(post),
        Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.02),
          child: Text(post.content, style: TextStyle(fontSize: width * 0.04)),
        ),
        BuildActionButton(width: width),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget _buildPostHeader(Post post) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(post.profileImage),
          radius: 20,
        ),
        const SizedBox(width: 8),
        Text(
          post.username,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text(
          post.time,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
