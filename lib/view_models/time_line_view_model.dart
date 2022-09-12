//Packages
import 'package:flutter/material.dart';

class TimeLineViewModel extends ChangeNotifier {
  final List<String> _rankingList = [
    'testetete',
    'aaaaaaa',
    'aaaadadsad',
    'uiuiuiuiu',
  ];
  List<String> get rankingList {
    return [..._rankingList];
  }
}
