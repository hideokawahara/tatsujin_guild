//Packages
import 'package:flutter/material.dart';

class MasterViewModel extends ChangeNotifier {
  String? _topic;
  String? get topic {
    return _topic;
  }

  Future<void> fetchTopic() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _topic = '駄洒落';
    notifyListeners();
  }
}
