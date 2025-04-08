import 'package:firebase_project/utils/models/post_data_model.dart';

List<Post> dummyPosts = [
  // Post with comments
  Post(
    username: "Maude Hall",
    profileImage: "assets/profile.png",
    time: "14 min",
    content:
        "Hey! My body weight is increasing. I'm gaining weight and want some suggestions.",
    comments: [
      Comment(
        username: "Dianne Russell",
        profileImage: "assets/profile_2.png",
        time: "24 min",
        content:
            "Sure! First, can you tell me about your daily routine and eating habits? That will help me suggest something suitable.",
      ),
      Comment(
        username: "Esther Howard",
        profileImage: "assets/profile_2.png",
        time: "26 min",
        content:
            "I mostly sit all day due to work, and my diet includes a lot of carbs and snacks.",
      ),
    ],
  ),

  // Another post with comments
  Post(
    username: "Maude Hall",
    profileImage: "assets/profile.png",
    time: "14 min",
    content:
        "Hey! My body weight is increasing. I'm gaining weight and want some suggestions.",
    comments: [
      Comment(
        username: "Dianne Russell",
        profileImage: "assets/profile.png",
        time: "24 min",
        content:
            "Sure! First, can you tell me about your daily routine and eating habits? That will help me suggest something suitable.",
      ),
    ],
  ),

  // Post without comments
  Post(
    username: "John Doe",
    profileImage: "assets/profile.pngpu",
    time: "10 min",
    content: "Just completed my first 5K run! Feeling great! 🎉",
    comments: [], // Empty list for posts without comments
  ),
];
