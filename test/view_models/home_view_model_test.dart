//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/home_view_model.dart';

void main() {
  group(
    'ランキングのテスト',
    () {
      test(
        'ランキングの取得',
        () async {
          final homeViewModel = HomeViewModel();
          expect(homeViewModel.postList, []);
          await homeViewModel.fetchRankingPosts();
          expect(homeViewModel.postList.isNotEmpty, true);
        },
      );
    },
  );
}
