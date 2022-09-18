//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Pages
import 'package:tatsujin_guild/pages/home_page.dart';
import 'package:tatsujin_guild/pages/posts_manage_page.dart';
import 'package:tatsujin_guild/pages/settings_page.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';

//Widgets
import 'package:tatsujin_guild/widgets/icon.dart';

class BottomTab extends StatelessWidget {
  BottomTab({Key? key}) : super(key: key);

  final Map<Widget, BottomNavigationBarItem> contents = {
    const HomePage(): const BottomNavigationBarItem(
      icon: BottomHomeIcon(),
      label: 'ホーム',
    ),
    const PostsManagePage(): const BottomNavigationBarItem(
      icon: BottomPostIcon(),
      label: '投稿',
    ),
    const SettingsPage(): const BottomNavigationBarItem(
      icon: BottomSettingIcon(),
      label: '設定',
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
        activeColor: AppColors.defaultActiveColor,
        inactiveColor: AppColors.defaultInactiveColor,
        backgroundColor: AppColors.defaultBackGroundColor,
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
