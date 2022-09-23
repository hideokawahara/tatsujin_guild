//Packages
import 'package:flutter_test/flutter_test.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

void main() {
  final authRepository = AuthRepositoryImpl();
  group('認証のテスト', () {
    test('ログイン情報取得', () async {
      final User? user = await authRepository.getMyData();
      expect(user != null, true);
    });
  });
}
