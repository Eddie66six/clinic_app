import 'package:flutter/material.dart';

import '../../system.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key key, this.text, this.screenWidthSize, this.tap})
      : super(key: key);
  String text;
  double screenWidthSize;
  Function tap;
  @override
  Widget build(BuildContext context) {
    return (new GestureDetector(
      onTap: () {
        tap();
      },
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: SystemRadius.NORMAL_BUTTON,
          color: SystemColors.ACCEPT_BUTTON,
        ),
        padding: new EdgeInsets.all(10.0),
        margin: new EdgeInsets.all(5.0),
        width: screenWidthSize / 3,
        height: 40.0,
        alignment: Alignment.center,
        child: new Text(
          this.text,
          style: new TextStyle(color: SystemColors.ACCEPT_BUTTON_LABEL),
        ),
      ),
    ));
  }
}
