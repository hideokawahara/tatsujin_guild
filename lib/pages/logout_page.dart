//Packages
import 'package:flutter/material.dart';

//Resources
import '../resources/app_styles.dart';
import 'package:tatsujin_guild/resources/app_colors.dart';

//Widgets
import '../widgets/icon.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultBackGroundColor,
        title: const Text(
          'ログアウト',
          style: AppStyles.titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const BackArrowIcon(),
        ),
      ),
      backgroundColor: AppColors.settingsBackGroundColor,
      body: const LogoutPageBody(),
    );
  }
}

class LogoutPageBody extends StatelessWidget {
  const LogoutPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('logout'),
    );
  }
}
