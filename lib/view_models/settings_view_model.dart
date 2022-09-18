//Packages
import 'package:flutter/material.dart';

//Pages
import 'package:tatsujin_guild/pages/delete_account_page.dart';
import 'package:tatsujin_guild/pages/logout_page.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel({
    required this.context,
  }) {
    _settingsContents = [
      {
        'list_title': 'ログアウト',
        'list_icon': const Icon(
          Icons.logout,
        ),
        'list_function': () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const LogoutPage(),
            ),
          );
        },
      },
      {
        'list_title': 'アカウント削除',
        'list_icon': const Icon(
          Icons.delete_forever,
        ),
        'list_function': () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const DeleteAccountPage(),
            ),
          );
        },
      },
    ];
  }
  final BuildContext context;
  List<Map<String, dynamic>> _settingsContents = [];
  List<Map<String, dynamic>> get settingsContents {
    return [..._settingsContents];
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
