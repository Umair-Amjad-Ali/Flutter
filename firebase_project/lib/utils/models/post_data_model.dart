class Post {
  final String username;
  final String profileImage;
  final String time;
  final String content;
  final List<Comment> comments;

  Post({
    required this.username,
    required this.profileImage,
    required this.time,
    required this.content,
    required this.comments,
  });
}

class Comment {
  final String username;
  final String profileImage;
  final String time;
  final String content;

  Comment({
    required this.username,
    required this.profileImage,
    required this.time,
    required this.content,
  });
}
