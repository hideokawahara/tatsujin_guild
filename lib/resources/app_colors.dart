//Packages
import 'package:flutter/material.dart';

class AppColors {
  static const defaultBackGroundColor = Colors.white;
  static const defaultInactiveColor = Colors.grey;
  static const defaultActiveColor = Colors.black;
  static const mainAppColor = Color(0xFF1538B7);

  /// タブの色設定
  // tabのアクティブカラーは要らないかもしれない
  static const tabActiveColor = Colors.redAccent;
  static const tabActiveTextColor = Colors.white;
  static const tabInactiveTextColor = Colors.black;

  // 設定画面の設定
  //Todo: 定数にしたい
  static Color? settingsBackGroundColor = Colors.grey[200];
}
