//Packages
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List<String> _postList = [
    'testetete',
    'aaaaaaa',
    'aaaadadsad',
    'uiuiuiuiu',
  ];
  List<String> get postList {
    return [..._postList];
  }
}
