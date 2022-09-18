//Packages
import 'package:flutter/material.dart';

//Resources
import 'package:tatsujin_guild/resources/app_styles.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '設定',
          style: AppStyles.titleStyle,
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SettingPageBody(),
    );
  }
}

class SettingPageBody extends StatelessWidget {
  SettingPageBody({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> settingsContents = [
    {
      'list_title': 'ログアウト',
      'list_icon': const Icon(
        Icons.logout,
      ),
      'list_function': () {
        print('from logout');
      },
    },
    {
      'list_title': 'アカウント削除',
      'list_icon': const Icon(
        Icons.delete_forever,
      ),
      'list_function': () {
        print('from delete');
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
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
            final String? setTitle = getContent<String>(
              json: content,
              property: 'list_title',
            );
            final Widget? setIcon = getContent<Widget>(
              json: content,
              property: 'list_icon',
            );
            final Function? setFunction = getContent<Function>(
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

  T? getContent<T>({
    required Map<String, dynamic> json,
    required String property,
  }) {
    if (json.containsKey(property) && json[property] is T) {
      return json[property];
    } else {
      return null;
    }
  }
}
