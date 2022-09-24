//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/auth_view_model.dart';

void main() {
  final authViewModel = AuthViewModel(
    //Todo: テスト用のリポジトリに変える
    auth: AuthRepositoryImpl(),
  );
  group('ログインのテスト', () {
    test('ログイン情報取得', () async {
      expect(authViewModel.myData, null);
      expect(authViewModel.isLogin, false);
      await authViewModel.fetchMyData();
      expect(authViewModel.myData is User, true);
      expect(authViewModel.isLogin, true);
    });
  });
}
