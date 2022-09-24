//Packages
import 'package:flutter/cupertino.dart';
import 'dart:io';

//Utils
import 'package:tatsujin_guild/utils/progress_function.dart';
import 'dialog.dart';
import 'package:tatsujin_guild/utils/image_picker_function.dart';

Future<bool> showDeletePopup({
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

enum Photo {
  library,
  camera,
}

Future<File?> showGetImagePopUp({required BuildContext context}) async {
  Photo? result = await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop(Photo.library);
            },
            child: const Text(
              'ライブラリから選ぶ',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop(Photo.camera);
            },
            child: const Text(
              '写真を撮る',
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'キャンセル',
          ),
        ),
      );
    },
  );
  if (result == null) {
    return null;
  } else if (result == Photo.library) {
    return await getPhotoFromLibrary();
  } else if (result == Photo.camera) {
    return await getPhotoFromCamera();
  } else {
    return null;
  }
}
