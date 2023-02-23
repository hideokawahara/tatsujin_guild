//Packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//Models
import 'package:tatsujin_guild/models/post.dart';

//Mocks
import 'time_line_view_model_test.mocks.dart';

//Repositories
import 'package:tatsujin_guild/repositories/post_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/time_line_view_model.dart';

@GenerateNiceMocks([MockSpec<PostRepositoryImpl>()])
void main() {
  final mockRepository = MockPostRepositoryImpl();
  final timeLineViewModel = TimeLineViewModel(
    postRepository: mockRepository,
  );
  when(mockRepository.getRankingPosts())
      .thenAnswer((_) => Future.value(_dummyPostList));
  when(mockRepository.getTimeLinePosts())
      .thenAnswer((_) => Future.value(_dummyPostList2));
  when(mockRepository.postTimeLinePost(post: anyNamed('post')))
      .thenAnswer((_) => Future.value(true));
  group('取得のテスト', () {
    test('ランキングと投稿の取得', () async {
      expect(timeLineViewModel.rankingList.isEmpty, true);
      expect(timeLineViewModel.timeLineList.isEmpty, true);
      await timeLineViewModel.fetchInitialAllPosts();
      verify(mockRepository.getRankingPosts());
      verify(mockRepository.getTimeLinePosts());
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
      verifyNever(mockRepository.postTimeLinePost(post: anyNamed('post')));
      bool result = await timeLineViewModel.createPost(post);
      verify(mockRepository.postTimeLinePost(post: anyNamed('post')));
      expect(result, true);
    });
  });
}

List<Post> _dummyPostList = [
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
];

List<Post> _dummyPostList2 = [
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
