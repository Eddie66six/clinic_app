import 'package:flutter/material.dart';

import '../../system.dart';

class AlertButton extends StatelessWidget {
  AlertButton({Key key, this.text, this.screenWidthSize, this.tap})
      : super(key: key);
  final String text;
  final double screenWidthSize;
  final Function tap;
  @override
  Widget build(BuildContext context) {
    return (new GestureDetector(
      onTap: () {
        tap();
      },
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: SystemRadius.NORMAL_BUTTON,
          color: SystemColors.ALERT_BUTTON,
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
