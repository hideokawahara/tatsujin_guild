//Models
import 'package:tatsujin_guild/models/user.dart';

abstract class AuthRepository {
  Future<bool> postLogin({
    required String email,
    required String password,
  });
  Future<User?> getMyData();
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<bool> postLogin({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return true;
  }

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
      'はじめまして！プロフィールを見て頂きありがとうございます。\n大阪在住の〇〇（名前）といいます。\n結婚を考えていた相手とお別れしたことをきっかけにアプリを始めました！',
  'main_photo':
      'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
};
