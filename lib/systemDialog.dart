import 'package:flutter/material.dart';

import 'components/buttons/alertButton.dart';

class SystemDialog {
  static void openAlertDialog(BuildContext context, double width, String message) {
    showDialog(
      context: context, builder: (context) => new AlertDialog(
        title: new Text(message),
        content: new AlertButton(
          text: "OK",
          screenWidthSize: width,
          tap: () {
            Navigator.pop(context);
          },
      )));
  }
}
