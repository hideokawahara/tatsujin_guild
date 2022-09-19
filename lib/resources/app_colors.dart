//Packages
import 'package:flutter/material.dart';

class AppColors {
  static const defaultBackGroundColor = Colors.white;
  static const defaultInactiveColor = Colors.grey;
  static const defaultActiveColor = Colors.black;
  static const mainAppColor = Color(0xFF1538B7);

  /// デコレーション用の背景
  static const mainAppColorDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: [
        mainAppColor,
        Colors.black,
      ],
      stops: [
        0.0,
        1.0,
      ],
    ),
  );

  /// タブの色設定
  // tabのアクティブカラーは要らないかもしれない
  static const tabActiveColor = Colors.redAccent;
  static const tabActiveTextColor = Colors.white;
  static const tabInactiveTextColor = Colors.black;

  // 設定画面の設定
  static const settingsBackGroundColor = Color(0xFFEEEEEE);
}
