//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_colors.dart';
import 'package:tatsujin_guild/resources/app_styles.dart';

class DefaultTabBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultTabBar({
    Key? key,
    required this.tabContents,
  }) : super(key: key);
  final List<String> tabContents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: TabBar(
        unselectedLabelColor: AppColors.tabInactiveTextColor,
        labelColor: AppColors.tabActiveTextColor,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.tabActiveColor,
        ),
        labelStyle: AppStyles.activeTabStyle,
        unselectedLabelStyle: AppStyles.inactiveTabStyle,
        tabs: tabContents
            .map(
              (content) => Tab(
                child: Text(content),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
