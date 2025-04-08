import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_project/utils/models/post_data_model.dart';
import 'package:firebase_project/utils/post_dummy_data.dart';
import 'package:firebase_project/widgets/build_action_button.dart';
import 'package:firebase_project/widgets/comment_input.dart';
import 'package:flutter/material.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children:
                  dummyPosts.map((post) => _buildPost(width, post)).toList(),
            ),
          ),
          CommentInput(width: width),
        ],
      ),
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
        if (post.comments.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: width * 0.025),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.02),
                  child: SizedBox(
                    height: (post.comments.length * 90).toDouble(),
                    child: const DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      dashColor: Colors.grey,
                      dashLength: 4,
                      dashGapLength: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children:
                        post.comments
                            .map((comment) => _buildComment(width, comment))
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
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

  Widget _buildComment(double width, Comment comment) {
    return Padding(
      padding: EdgeInsets.only(top: width * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(comment.profileImage),
            radius: 15,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.username,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      comment.time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: width * 0.01),
                  child: Text(
                    comment.content,
                    style: TextStyle(fontSize: width * 0.038),
                  ),
                ),
                BuildActionButton(width: width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
