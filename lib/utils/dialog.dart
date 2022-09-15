//Packages
import 'package:flutter/material.dart';

Future<void> showResultDialog(
    {required BuildContext context, required String dialogText}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Align(
        alignment: const Alignment(0, -0.1),
        child: Container(
          alignment: Alignment.center,
          width: 343,
          height: 94,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Material(
            color: Colors.white,
            child: Text(
              dialogText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    },
  );
}
