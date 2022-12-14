//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/time_line_view_model.dart';

void main() {
  final timeLineViewModel = TimeLineViewModel(
    postRepository: PostRepositoryImpl(),
  );
  group('取得のテスト', () {
    test('ランキングと投稿の取得', () async {
      expect(timeLineViewModel.rankingList.isEmpty, true);
      expect(timeLineViewModel.timeLineList.isEmpty, true);
      await timeLineViewModel.fetchInitialAllPosts();
      expect(timeLineViewModel.rankingList.isNotEmpty, true);
      expect(timeLineViewModel.timeLineList.isNotEmpty, true);
    });
  });

  group('投稿ボタンのテスト', () {
    test('like counterの有効時のテスト', () {
      for (int i = 0; i < 5; i++) {
        if (i < 3) {
          expect(timeLineViewModel.isShow, false);
          expect(timeLineViewModel.likeCounter, i);
        } else if (i >= 3) {
          expect(timeLineViewModel.isShow, true);
          expect(timeLineViewModel.likeCounter, i);
        }
        timeLineViewModel.addLikeCounter();
      }
    });
    test('投稿のテスト', () async {
      final Post post = Post(
        authorName: 'test user',
        authorImage: 'no url',
        contents: 'post text',
        likesCounts: 0,
      );
      bool result = await timeLineViewModel.createPost(post);
      expect(result, true);
    });
  });
}
