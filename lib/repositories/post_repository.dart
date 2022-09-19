//Models
import 'package:tatsujin_guild/models/post.dart';

abstract class PostRepository {
  ///ランキングの投稿を取得
  Future<List<Post>> getRankingPosts();

  ///タイムラインの投稿を取得
  Future<List<Post>> getTimeLinePosts();
}

class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<Post>> getRankingPosts() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    List<Post> result = _dummyPostList;
    return result;
  }

  @override
  Future<List<Post>> getTimeLinePosts() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    List<Post> result = _dummyPostList2;
    return result;
  }
}

List<Post> _dummyPostList = [
  Post(
    authorName: 'ユーキ',
    authorAge: 28,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorAge: 32,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorAge: 29,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorAge: 22,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
  Post(
    authorName: 'ユーキ',
    authorAge: 28,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorAge: 32,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorAge: 29,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorAge: 22,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
  Post(
    authorName: 'ユーキ',
    authorAge: 28,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorAge: 32,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
];

List<Post> _dummyPostList2 = [
  Post(
    authorName: 'ユーキ',
    authorAge: 28,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorAge: 32,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorAge: 29,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorAge: 22,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
  Post(
    authorName: 'ユーキ',
    authorAge: 28,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/danda-danda-danda-_MKT5249-11344-11395-11417.jpg.webp?d=1420',
    contents: 'Q：小野洋子さんはどこにいますか？\n「オノヨーコ、そおのよーこ」',
    likesCounts: 2748,
  ),
  Post(
    authorName: 'こーへい',
    authorAge: 32,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/KENTA883_hansyaban.jpg.webp?d=1420',
    contents: '水原希子に自ら聞こう。',
    likesCounts: 1808,
  ),
  Post(
    authorName: '三上',
    authorAge: 29,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/MAX20160I9A9490.jpg.webp?d=1420',
    contents: '肉まんを憎まん',
    likesCounts: 1511,
  ),
  Post(
    authorName: 'ゆうくん',
    authorAge: 22,
    authorImage:
        'https://pakutaso.cdn.rabify.me/shared/img/thumb/ookawa_MKT4826-11759.jpg.webp?d=1420',
    contents: '小野小町、斧のコマネチ',
    likesCounts: 1027,
  ),
];