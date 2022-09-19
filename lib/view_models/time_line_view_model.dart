//Packages
import 'package:flutter/material.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

class TimeLineViewModel extends ChangeNotifier {
  final List<Post> _rankingList = [];
  List<Post> get rankingList {
    return [..._rankingList];
  }

  final List<Post> _timeLineList = [];
  List<Post> get timeLineList {
    return [..._timeLineList];
  }

  int _likeCounter = 0;
  int get likeCounter {
    return _likeCounter;
  }

  bool isShow = false;

  void addLikeCounter() {
    _likeCounter++;
    if (_likeCounter == 3) {
      isShow = true;
    }
    notifyListeners();
  }

  final postRepository = PostRepositoryImpl();

  Future<void> fetchInitialAllPosts() async {
    List<Post> rankingResult = await postRepository.getRankingPosts();
    _rankingList.clear();
    _rankingList.addAll(rankingResult);

    List<Post> timeLineResult = await postRepository.getTimeLinePosts();
    _timeLineList.clear();
    _timeLineList.addAll(timeLineResult);

    notifyListeners();
  }
}
