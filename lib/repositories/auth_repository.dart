//Models
import 'package:tatsujin_guild/models/user.dart';

abstract class AuthRepository {
  Future<User?> getMyData();
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<User?> getMyData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    try {
      var myData = User.fromJSON(_dummyMyData2);
      return myData;
    } catch (e) {
      print('failed my data construct');
      print(e);
    }
    return null;
  }
}

Map<String, dynamic> _dummyMyData2 = {
  'name': '達人太郎子',
  'profile_message':
      'はじめまして！プロフィールを見て頂きありがとうございます。\n大阪在住の〇〇（名前）といいます。\n結婚を考えていた相手とお別れしたことをきっかけにアプリを始めました！\n【仕事】\nシステムエンジニアをしています。\nお客さんと打合せしながら、日々新しいシステムを作っています。\n忙しい時期もありますが、大きなプロジェクトが無事に完遂して感謝のお言葉を頂いたときは達成感があります！\nパソコンについてはそこそこ詳しいので、困ったときはなんでも聞いてください😁笑\n【趣味】\nどちらかというとインドア派で、休日は映画を見たり楽器をいじったりすることが多いです。\nでも、たまに友達と飲みに行ったりドライブしたり旅行に行くのも大好きです！\n【性格】\n性格は明るい・ポジティブといわれることが多いです。\n割と人懐っこいので、初対面の相手とも仲良くなりやすいタイプです。\n彼女ができたら一緒に美味しいお店を探したり、まったり映画を観たりして楽しい時間を過ごしたいです。\n最後まで見ていただきありがとうございます。\nどうぞよろしくお願いします！',
  'main_photo':
      'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
};
