import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget{
  RoundedButton({Key key, this.text, this.screenWidthSize, this.tap})
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
          borderRadius: new BorderRadius.circular(30.0),
          color: const Color.fromARGB(255, 30, 96, 238),
        ),
        padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
        width: screenWidthSize / 1.7,
        alignment: Alignment.center,
        child: new Text(
          this.text,
          style: new TextStyle(color: Colors.white, fontSize: 24.0),
        ),
      ),
    ));
  }
}
