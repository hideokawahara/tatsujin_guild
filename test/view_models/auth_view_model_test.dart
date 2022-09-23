//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/auth_view_model.dart';

void main() {
  final authViewModel = AuthViewModel();
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
