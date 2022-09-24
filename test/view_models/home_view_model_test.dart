//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/home_view_model.dart';

void main() {
  group(
    'ランキングのテスト',
    () {
      test(
        'ランキングの取得',
        () async {
          final homeViewModel = HomeViewModel(
            //todo: テスト用のリポジトリに差し替える
            postRepository: PostRepositoryImpl(),
          );
          expect(homeViewModel.postList, []);
          await homeViewModel.fetchRankingPosts();
          expect(homeViewModel.postList.isNotEmpty, true);
        },
      );
    },
  );
}
