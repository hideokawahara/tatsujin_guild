//Packages
import 'package:flutter/material.dart';

//Models
import '../models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Post> _postList = [];
  List<Post> get postList {
    return [..._postList];
  }

  final postRepository = PostRepositoryImpl();

  Future<void> fetchRankingPosts() async {
    List<Post> result = await postRepository.getRankingPosts();
    _postList.clear();
    _postList.addAll(result.take(4));
    notifyListeners();
  }
}
