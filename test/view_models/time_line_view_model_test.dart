//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/time_line_view_model.dart';

void main() {
  final timeLineViewModel = TimeLineViewModel();
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
      bool result = await timeLineViewModel.createPost();
      expect(result, true);
    });
  });
}
