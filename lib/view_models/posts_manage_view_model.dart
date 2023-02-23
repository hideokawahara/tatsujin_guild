//Packages
import 'package:flutter/material.dart';

//Models
import '../models/post/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

class PostsManageViewModel extends ChangeNotifier {
  PostsManageViewModel({
    required this.postRepository,
  });
  final PostRepository postRepository;
  final List<Post> _postList = [];
  List<Post> get postList {
    return [..._postList];
  }

  final List<Post> _favoriteList = [];
  List<Post> get favoriteList {
    return [..._favoriteList];
  }

  Future<void> fetchInitialAllPosts() async {
    List<Post> myPostResult = await postRepository.getMyPosts();
    _postList.clear();
    _postList.addAll(myPostResult);

    List<Post> favoriteResult = await postRepository.getFavoritePosts();
    _favoriteList.clear();
    _favoriteList.addAll(favoriteResult);

    notifyListeners();
  }

  Future<bool> deleteMyPost(Post post) async {
    bool result = await postRepository.deleteMyPost(post: post);
    notifyListeners();
    return result;
  }

  Future<bool> deleteFavorite(Post post) async {
    bool result = await postRepository.deleteFavoritePost(post: post);
    notifyListeners();
    return result;
  }
}
