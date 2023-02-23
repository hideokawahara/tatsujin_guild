//Packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//Mocks
import 'posts_manage_view_model_test.mocks.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/posts_manage_view_model.dart';

@GenerateNiceMocks([
  MockSpec<PostRepositoryImpl>(),
])
void main() {
  final mockRepository = MockPostRepositoryImpl();
  final postViewModel = PostsManageViewModel(
    postRepository: mockRepository,
  );
  when(mockRepository.getMyPosts())
      .thenAnswer((_) => Future.value(_dummyPostList3));
  when(mockRepository.getFavoritePosts())
      .thenAnswer((_) => Future.value(_dummyPostList4));
  when(mockRepository.deleteMyPost(post: anyNamed('post')))
      .thenAnswer((_) => Future.value(true));
  when(mockRepository.deleteFavoritePost(post: anyNamed('post')))
      .thenAnswer((_) => Future.value(true));
  group('取得のテスト', () {
    test('投稿とお気に入りの取得', () async {
      expect(postViewModel.postList.isEmpty, true);
      expect(postViewModel.favoriteList.isEmpty, true);
      await postViewModel.fetchInitialAllPosts();
      verify(mockRepository.getMyPosts());
      verify(mockRepository.getFavoritePosts());
      expect(postViewModel.postList.isNotEmpty, true);
      expect(postViewModel.favoriteList.isNotEmpty, true);
    });
  });

  group('削除のテスト', () {
    test('投稿の削除', () async {
      await postViewModel.fetchInitialAllPosts();
      verify(mockRepository.getMyPosts());
      verify(mockRepository.getFavoritePosts());
      final List<Post> initialList = [...postViewModel.postList];
      final post = initialList.first;
      bool result = await postViewModel.deleteMyPost(post);
      verify(mockRepository.deleteMyPost(post: anyNamed('post')));
      expect(result, true);
      when(mockRepository.getMyPosts()).thenAnswer(
        (_) => Future.value(
          [..._dummyPostList3]..removeRange(0, 1),
        ),
      );
      await postViewModel.fetchInitialAllPosts();
      final List<Post> updateList = postViewModel.postList;
      expect(updateList.length, initialList.length - 1);
    });
    test('お気に入りの削除', () async {
      await postViewModel.fetchInitialAllPosts();
      verify(mockRepository.getMyPosts());
      verify(mockRepository.getFavoritePosts());
      final List<Post> initialList = [...postViewModel.favoriteList];
      final post = initialList.first;
      bool result = await postViewModel.deleteFavorite(post);
      verify(mockRepository.deleteFavoritePost(post: anyNamed('post')));
      expect(result, true);
      when(mockRepository.getFavoritePosts()).thenAnswer(
        (_) => Future.value(
          [..._dummyPostList4]..removeRange(0, 1),
        ),
      );
      await postViewModel.fetchInitialAllPosts();
      final List<Post> updateList = postViewModel.favoriteList;
      expect(updateList.length, initialList.length - 1);
    });
  });
}

List<Post> _dummyPostList3 = [
  Post(
    authorName: 'ユーキ',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
];

List<Post> _dummyPostList4 = [
  Post(
    authorName: 'ユーキ',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
  Post(
    authorName: 'ユーキ',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
];
