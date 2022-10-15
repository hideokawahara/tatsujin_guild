//Packages
import 'package:flutter/material.dart';
import 'dart:io';

//Models
import 'package:tatsujin_guild/models/user.dart';

//Repositories
import 'package:tatsujin_guild/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required this.auth,
  });
  final AuthRepository auth;

  User? _myData;
  User? get myData {
    return _myData;
  }

  bool _isLogin = false;
  bool get isLogin {
    return _isLogin;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async =>
      auth.postLogin(
        email: email,
        password: password,
      );

  Future<bool> fetchMyData() async {
    User? setMyData = await auth.getMyData();
    if (setMyData != null) {
      _myData = setMyData;
      _isLogin = true;
      return true;
    } else {
      return false;
    }
  }

  void addMainPhoto(File file) {
    if (_myData != null) {
      _myData!.mainPhoto = file.path;
      notifyListeners();
    } else {
      return;
    }
  }

  void addMessageText(String text) {
    if (_myData != null) {
      _myData!.profileMessage = text;
      notifyListeners();
    } else {
      return;
    }
  }
}
