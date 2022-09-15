//Packages
import 'package:flutter/cupertino.dart';

//Utils
import 'package:tatsujin_guild/utils/progress_function.dart';
import 'dialog.dart';

Future<bool> showRemoveFavoritePopup({
  required BuildContext context,
  required String messageText,
  required String deleteText,
  required String cancelText,
  required Future<bool> Function() removeFavoriteCallback,
}) async {
  bool? result = await showCupertinoModalPopup<bool?>(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        message: Text(
          messageText,
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              deleteText,
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            cancelText,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      );
    },
  );
  if (result != null && result) {
    bool result = await functionUseProgressIndicator(
      context: context,
      function: () => removeFavoriteCallback(),
    );
    if (result) {
      await showResultDialog(
        context: context,
        dialogText: '削除しました',
      );
      return true;
    } else {
      await showResultDialog(
        context: context,
        dialogText: '削除に失敗しました',
      );
      return false;
    }
  } else {
    return false;
  }
}
