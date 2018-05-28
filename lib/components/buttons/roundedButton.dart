import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget{
  RoundedButton({Key key, this.text, this.screenWidthSize, this.tap, this.typeSize = EnumTypeSize.MEDIUM, this.color, this.fontColor})
      : super(key: key);
  final String text;
  final double screenWidthSize;
  final Function tap;
  final double typeSize;
  final Color color;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return (new GestureDetector(
      onTap: () {
        tap();
      },
      child: new Container(
        decoration: new BoxDecoration(
          border: color == null || color == Colors.transparent ? new Border.all(color: Colors.grey) : new Border(),
          borderRadius: new BorderRadius.circular(30.0),
          color: color ?? Colors.transparent,
        ),
        padding: new EdgeInsets.only(top: typeSize, bottom: typeSize),
        width: screenWidthSize,
        alignment: Alignment.center,
        child: new Text(
          this.text,
          style: new TextStyle(color: fontColor ?? Colors.black,
            fontSize: typeSize == EnumTypeSize.SMALL ? 18.0 : typeSize == EnumTypeSize.MEDIUM ? 18.0 : 24.0
          ),
        ),
      ),
    ));
  }
}

class EnumTypeSize{
  static const double SMALL = 5.0;
  static const double MEDIUM = 10.0;
  static const double BIG = 12.0;
}
