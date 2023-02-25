// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      authorName: json['author_name'] as String,
      authorImage: json['author_image'] as String,
      contents: json['contents'] as String,
      likesCounts: json['likes_counts'] as int,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'author_name': instance.authorName,
      'author_image': instance.authorImage,
      'contents': instance.contents,
      'likes_counts': instance.likesCounts,
    };
