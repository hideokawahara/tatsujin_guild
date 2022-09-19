//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

void main() {
  group('投稿の取得のテスト', () {
    test('ランキングの取得', () async {
      final postRepository = PostRepositoryImpl();
      final List<Post> result = await postRepository.getRankingPosts();
      expect(result.isNotEmpty, true);
    });
    test('タイムラインの取得', () async {
      final postRepository = PostRepositoryImpl();
      final List<Post> result = await postRepository.getTimeLinePosts();
      expect(result.isNotEmpty, true);
    });
  });
}
