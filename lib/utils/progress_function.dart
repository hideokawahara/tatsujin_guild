//Packages
import 'package:flutter/material.dart';

//Widgets
import 'package:tatsujin_guild/widgets/circular_indicator.dart';

Future<bool> functionUseProgressIndicator({
  required BuildContext context,
  required Future<bool> Function() function,
}) async {
  BuildContext innerContext = context;
  NavigatorState? navigator;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      innerContext = context;
      navigator = Navigator.of(innerContext);
      return const DefaultCircularIndicator();
    },
  );
  bool result = await function();
  navigator?.pop();
  return result;
}
