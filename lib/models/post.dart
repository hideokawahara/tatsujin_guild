class Post {
  Post({
    required this.authorName,
    required this.authorAge,
    required this.authorImage,
    required this.contents,
    required this.likesCounts,
  });
  final String authorName;
  final int authorAge;
  final String authorImage;
  final String contents;
  final int likesCounts;

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      authorName: json['author_name'],
      authorAge: json['author_age'],
      authorImage: json['author_image'],
      contents: json['contents'],
      likesCounts: json['likes_counts'],
    );
  }
}
