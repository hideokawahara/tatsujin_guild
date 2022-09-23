//Packages
import 'package:flutter/material.dart';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final _auth = AuthRepositoryImpl();

  User? _myData;
  User? get myData {
    return _myData;
  }

  bool _isLogin = false;
  bool get isLogin {
    return _isLogin;
  }

  Future<bool> fetchMyData() async {
    User? setMyData = await _auth.getMyData();
    if (setMyData != null) {
      _myData = setMyData;
      _isLogin = true;
      return true;
    } else {
      return false;
    }
  }
}
