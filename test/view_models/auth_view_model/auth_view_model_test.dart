//Packages
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

//Mocks
import 'auth_view_model_test.mocks.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/auth_view_model.dart';

@GenerateNiceMocks([
  MockSpec<AuthRepositoryImpl>(),
])
void main() {
  final mockRepository = MockAuthRepositoryImpl();
  final authViewModel = AuthViewModel(auth: mockRepository);
  when(mockRepository.getMyData()).thenAnswer((_) => Future.value(testUser));
  group('ログインのテスト', () {
    test('ログイン情報取得', () async {
      expect(authViewModel.myData, null);
      expect(authViewModel.isLogin, false);
      await authViewModel.fetchMyData();
      expect(authViewModel.myData, isNotNull);
      verify(mockRepository.getMyData());
      expect(authViewModel.isLogin, true);
    });
  });
  group('ユーザー情報の編集', () {
    test('写真の変更', () async {
      await authViewModel.fetchMyData();
      expect(authViewModel.myData?.mainPhoto, isNotNull);
      verify(mockRepository.getMyData());
      final String previousPhoto = authViewModel.myData!.mainPhoto;
      authViewModel.addMainPhoto(
        File('test path'),
      );
      expect(authViewModel.myData?.mainPhoto, isNotNull);
      String newPhoto = authViewModel.myData!.mainPhoto;
      expect(newPhoto, isNot(equals(previousPhoto)));
    });
  });
}

final User testUser = User.fromJSON(
  {
    'name': '達人太郎子',
    'profile_message':
        'はじめまして！プロフィールを見て頂きありがとうございます。\n大阪在住の〇〇（名前）といいます。\n結婚を考えていた相手とお別れしたことをきっかけにアプリを始めました！',
    'main_photo':
        'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg',
  },
);
