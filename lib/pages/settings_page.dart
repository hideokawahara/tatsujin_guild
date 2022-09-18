//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Resources
import 'package:tatsujin_guild/resources/app_styles.dart';

//ViewModels
import 'package:tatsujin_guild/view_models/settings_view_model.dart';

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
          backgroundColor: Colors.white,
          title: const Text(
            '設定',
            style: AppStyles.titleStyle,
          ),
        ),
        backgroundColor: Colors.grey[200],
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
    List<Map<String, dynamic>> settingsContents =
        settingsViewModel.settingsContents;
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
                  CircleAvatar(
                    backgroundImage: Image.network(
                            'https://news.mynavi.jp/article/20211022-1984461/ogp_images/ogp.jpg')
                        .image,
                    radius: 65,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context, rootNavigator: true).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => const PhotoEditPage(),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.grey[200] ?? Colors.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                '達人太郎',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
