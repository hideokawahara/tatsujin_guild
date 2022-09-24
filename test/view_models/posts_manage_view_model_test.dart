//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/posts_manage_view_model.dart';

void main() {
  final postViewModel = PostsManageViewModel(
    //todo: テスト用のリポジトリに変更する
    postRepository: PostRepositoryImpl(),
  );
  group('取得のテスト', () {
    test('投稿とお気に入りの取得', () async {
      expect(postViewModel.postList.isEmpty, true);
      expect(postViewModel.favoriteList.isEmpty, true);
      await postViewModel.fetchInitialAllPosts();
      expect(postViewModel.postList.isNotEmpty, true);
      expect(postViewModel.favoriteList.isNotEmpty, true);
    });
  });

  group('削除のテスト', () {
    test('投稿の削除', () async {
      await postViewModel.fetchInitialAllPosts();
      final List<Post> initialList = [...postViewModel.postList];
      final post = initialList.first;
      bool result = await postViewModel.deleteMyPost(post);
      expect(result, true);
      await postViewModel.fetchInitialAllPosts();
      final List<Post> updateList = postViewModel.postList;
      expect(updateList.length, initialList.length - 1);
    });
    test('お気に入りの削除', () async {
      await postViewModel.fetchInitialAllPosts();
      final List<Post> initialList = [...postViewModel.favoriteList];
      final post = initialList.first;
      bool result = await postViewModel.deleteFavorite(post);
      expect(result, true);
      await postViewModel.fetchInitialAllPosts();
      final List<Post> updateList = postViewModel.favoriteList;
      expect(updateList.length, initialList.length - 1);
    });
  });
}
