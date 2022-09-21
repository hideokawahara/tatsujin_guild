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

  group('投稿管理のテスト', () {
    test('自分の投稿の取得', () async {
      final List<Post> result = await postRepository.getMyPosts();
      expect(result.isNotEmpty, true);
    });
    test('お気に入りの取得', () async {
      final List<Post> result = await postRepository.getFavoritePosts();
      expect(result.isNotEmpty, true);
    });
    test('自分の投稿の削除', () async {
      final List<Post> initialList = [...await postRepository.getMyPosts()];
      final Post post = initialList.first;
      bool result = await postRepository.deleteMyPost(post: post);
      expect(result, true);
      final List<Post> updateList = await postRepository.getMyPosts();
      expect(updateList.length, initialList.length - 1);
    });
    test('お気に入りの削除', () async {
      final List<Post> initialList = [
        ...await postRepository.getFavoritePosts()
      ];
      final Post post = initialList.first;
      bool result = await postRepository.deleteFavoritePost(post: post);
      expect(result, true);
      final List<Post> updateList = await postRepository.getFavoritePosts();
      expect(updateList.length, initialList.length - 1);
    });
  });
}
