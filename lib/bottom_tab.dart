import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatelessWidget {
  BottomTab({Key? key}) : super(key: key);

  final Map<Widget, BottomNavigationBarItem> contents = {
    const Text('ホーム'): const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'ホーム',
    ),
    const Text('投稿'): const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: '投稿',
    ),
    const Text('マイページ'): const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'マイページ',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageWidgets = contents.entries
        .map(
          (content) => content.key,
        )
        .toList();
    final List<BottomNavigationBarItem> tabItems = contents.entries
        .map(
          (content) => content.value,
        )
        .toList();
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabItems,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.white,
        // 追加したプロパティを記述する
        height: 66,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          return pageWidgets[index];
        });
      },
    );
  }
}
