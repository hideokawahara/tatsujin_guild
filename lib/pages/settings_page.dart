//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Pages
import 'package:tatsujin_guild/pages/my_page.dart';

//Resources
import 'package:tatsujin_guild/resources/app_styles.dart';
import 'package:tatsujin_guild/resources/app_colors.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/settings_view_model.dart';
import 'package:tatsujin_guild/view_models/auth_view_model.dart';

//Widgets
import 'package:tatsujin_guild/widgets/user_avatar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsViewModel(
        context: context,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.defaultBackGroundColor,
          title: const Text(
            '設定',
            style: AppStyles.titleStyle,
          ),
        ),
        backgroundColor: AppColors.settingsBackGroundColor,
        body: const SettingPageBody(),
      ),
    );
  }
}

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final settingsViewModel =
        Provider.of<SettingsViewModel>(context, listen: false);
    final List<Map<String, dynamic>> settingsContents =
        settingsViewModel.settingsContents;
    final List<Map<String, dynamic>> informationContents =
        settingsViewModel.informationContents;
    return Container(
      height: screenHeight,
      padding: const EdgeInsets.all(
        16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Consumer<AuthViewModel>(builder: (context, authModel, child) {
                    final String? photoPath = authModel.myData?.mainPhoto;
                    return UserCircleAvatar(
                      path: photoPath,
                      radius: 65,
                    );
                  }),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MyPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.mainAppColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColors.settingsBackGroundColor,
                          width: 4,
                        ),
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Consumer<AuthViewModel>(builder: (context, authModel, child) {
                final String? name = authModel.myData?.name;
                return Text(
                  name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            '設定',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ...settingsContents.map((content) {
            final String? setTitle = settingsViewModel.getContent<String>(
              json: content,
              property: 'list_title',
            );
            final Widget? setIcon = settingsViewModel.getContent<Widget>(
              json: content,
              property: 'list_icon',
            );
            final Function? setFunction =
                settingsViewModel.getContent<Function>(
              json: content,
              property: 'list_function',
            );
            return settingListTile(
              title: setTitle,
              icon: setIcon,
              listCallback: setFunction,
            );
          }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'お知らせ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ...informationContents.map((content) {
            final String? setTitle = settingsViewModel.getContent<String>(
              json: content,
              property: 'list_title',
            );
            final Widget? setIcon = settingsViewModel.getContent<Widget>(
              json: content,
              property: 'list_icon',
            );
            final Function? setFunction =
                settingsViewModel.getContent<Function>(
              json: content,
              property: 'list_function',
            );
            return settingListTile(
              title: setTitle,
              icon: setIcon,
              listCallback: setFunction,
            );
          }),
        ],
      ),
    );
  }

  Widget settingListTile({
    required String? title,
    required Widget? icon,
    required Function? listCallback,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title ?? ''),
      onTap: () {
        if (listCallback != null) {
          listCallback();
        }
      },
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey[300] ?? Colors.white,
        ),
      ),
      tileColor: Colors.white,
    );
  }
}
