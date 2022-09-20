//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

void main() {
  final postRepository = PostRepositoryImpl();
  group('投稿の取得のテスト', () {
    test('ランキングの取得', () async {
      final List<Post> result = await postRepository.getRankingPosts();
      expect(result.isNotEmpty, true);
    });
    test('タイムラインの取得', () async {
      final List<Post> result = await postRepository.getTimeLinePosts();
      expect(result.isNotEmpty, true);
    });
    test('投稿の実行', () async {
      final post = Post(
        authorName: '達人太郎',
        authorImage:
            'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
        contents: 'This is test',
        likesCounts: 0,
      );
      final List<Post> initialList = [
        ...await postRepository.getTimeLinePosts()
      ];
      bool result = await postRepository.postTimeLinePost(post: post);
      expect(result, true);
      final List<Post> updateList = await postRepository.getTimeLinePosts();
      expect(updateList.length, initialList.length + 1);
    });
  });
}
