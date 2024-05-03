

import 'package:flutter/material.dart';

class DialogManager {
  static Future<void> showLogoutDialog(
      BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 300.0,
            width: 300.0,
            padding: const EdgeInsets.all(16.0),
          ),
        );
      },
    );
  }
}
