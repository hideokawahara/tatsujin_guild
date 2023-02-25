//Packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'author_name') required String authorName,
    @JsonKey(name: 'author_image') required String authorImage,
    required String contents,
    @JsonKey(name: 'likes_counts') required int likesCounts,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
