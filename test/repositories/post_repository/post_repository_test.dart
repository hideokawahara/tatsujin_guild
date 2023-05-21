//Packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//Dummy
import 'package:tatsujin_guild/dummy_data/dummy_post.dart';

//Models
import 'package:tatsujin_guild/models/post/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//Test
import 'post_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostRepositoryImpl>()])
void main() {
  //todo: テスト用のリポジトリに差し替える
  final postRepository = MockPostRepositoryImpl();
  group('投稿の取得のテスト', () {
    test('ランキングの取得', () async {
      when(postRepository.getRankingPosts()).thenAnswer(
        (_) => Future.value(DummyPost.list),
      );
      final List<Post> result = await postRepository.getRankingPosts();
      expect(result.isNotEmpty, true);
    });
    test('タイムラインの取得', () async {
      when(postRepository.getTimeLinePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list2),
      );
      final List<Post> result = await postRepository.getTimeLinePosts();
      expect(result.isNotEmpty, true);
    });
    test('投稿の実行', () async {
      const post = Post(
        authorName: '達人太郎',
        authorImage:
            'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
        contents: 'This is test',
        likesCounts: 0,
      );
      when(postRepository.getTimeLinePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list2),
      );
      final List<Post> initialList = [
        ...await postRepository.getTimeLinePosts()
      ];
      when(postRepository.postTimeLinePost(post: post)).thenAnswer(
        (_) => Future.value(true),
      );
      bool result = await postRepository.postTimeLinePost(post: post);
      expect(result, true);
      when(postRepository.getTimeLinePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list2..insert(0, post)),
      );
      final List<Post> updateList = await postRepository.getTimeLinePosts();
      expect(updateList.length, initialList.length + 1);
    });
  });

  group('投稿管理のテスト', () {
    test('自分の投稿の取得', () async {
      when(postRepository.getMyPosts()).thenAnswer(
        (_) => Future.value(DummyPost.list3),
      );
      final List<Post> result = await postRepository.getMyPosts();
      expect(result.isNotEmpty, true);
    });
    test('お気に入りの取得', () async {
      when(postRepository.getFavoritePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list4),
      );
      final List<Post> result = await postRepository.getFavoritePosts();
      expect(result.isNotEmpty, true);
    });
    test('自分の投稿の削除', () async {
      when(postRepository.getMyPosts()).thenAnswer(
        (_) => Future.value(DummyPost.list3),
      );
      final List<Post> initialList = [...await postRepository.getMyPosts()];
      final Post post = initialList.first;
      when(postRepository.deleteMyPost(post: post))
          .thenAnswer((_) => Future.value(true));
      bool result = await postRepository.deleteMyPost(post: post);
      expect(result, true);
      when(postRepository.getMyPosts()).thenAnswer(
        (_) => Future.value(DummyPost.list3..remove(post)),
      );
      final List<Post> updateList = await postRepository.getMyPosts();
      expect(updateList.length, initialList.length - 1);
    });
    test('お気に入りの削除', () async {
      when(postRepository.getFavoritePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list4),
      );
      final List<Post> initialList = [
        ...await postRepository.getFavoritePosts()
      ];
      final Post post = initialList.first;
      when(postRepository.deleteFavoritePost(post: post)).thenAnswer(
        (_) => Future.value(true),
      );
      bool result = await postRepository.deleteFavoritePost(post: post);
      expect(result, true);
      when(postRepository.getFavoritePosts()).thenAnswer(
        (_) => Future.value(DummyPost.list4..remove(post)),
      );
      final List<Post> updateList = await postRepository.getFavoritePosts();
      expect(updateList.length, initialList.length - 1);
    });
  });
}
