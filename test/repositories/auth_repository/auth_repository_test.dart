//Packages
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

//Test
import 'auth_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepositoryImpl>()])
void main() {
  final authRepository = MockAuthRepositoryImpl();
  group('認証のテスト', () {
    test('ログイン情報取得', () async {
      when(authRepository.getMyData()).thenAnswer((_) => Future.value(testUser));
      final User? user = await authRepository.getMyData();
      expect(user != null, true);
    });
  });
}

final User testUser = User.fromJSON({
  'name': '達人太郎子',
  'profile_message':
  'はじめまして！プロフィールを見て頂きありがとうございます。\n大阪在住の〇〇（名前）といいます。\n結婚を考えていた相手とお別れしたことをきっかけにアプリを始めました！',
  'main_photo':
  'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
});
