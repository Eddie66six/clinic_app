import 'package:flutter/material.dart';

class SystemLoading {
  static void onLoadingShow(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: new Dialog(
        child: new Container(
          padding: new EdgeInsets.all(20.0),
            child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new CircularProgressIndicator(),
            new Container(
              margin: new EdgeInsets.only(left: 20.0),
              child: new Text('Carregando...'),
            ),
          ],
        )),
      ),
    );
  }

  static void onLoadingHide(BuildContext context) {
    Navigator.pop(context);
  }
}
