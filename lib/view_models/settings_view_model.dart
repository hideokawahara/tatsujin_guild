//Packages
import 'package:flutter/material.dart';

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
          print('from logout');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Text('test')));
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
