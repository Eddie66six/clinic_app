import 'dart:async';
import 'package:flutter/material.dart';

class Loading{
  static void onLoadingShow(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Text("Loading"),
          ],
        ),
      ),
    );
  }
  static void onLoadingHide(BuildContext context) {
    Navigator.pop(context);
  }
}