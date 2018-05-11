import 'package:flutter/material.dart';

class LineProgessBar extends StatefulWidget {
  LineProgessBar(this.size, this.percentage, this.text, this.backgroundBar, this.statusBar);
  final Size size;
  final double percentage;
  final String text;
  final Color backgroundBar;
  final Color statusBar;
  _LineProgessBarState createState() => new _LineProgessBarState();
}

class _LineProgessBarState extends State<LineProgessBar> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  var _percentage = 0.0;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = new Tween(begin: 0.0, end: widget.percentage).animate(controller)
      ..addListener(() {
        setState(() {
          _percentage = animation.value;
          print(_percentage);
        });
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return (new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(left: 5.0, right: 5.0, bottom: 15.0),
          child: new Row(
            children: <Widget>[
              new Text(widget.text, style: new TextStyle(fontSize: 16.0),),
              new Expanded(
                flex: 1,
                child: new Text(''),
              ),
              new Text(_percentage.toStringAsFixed(0)  + '%', style: new TextStyle(fontSize: 16.0),),
            ],
          ),
        ),
        new Container(
            height: 1.0,
            width: widget.size.width,
            padding: new EdgeInsets.only(
                right: widget.size.width - (_percentage * widget.size.width / 100), left: 0.0),
            decoration: new BoxDecoration(
                color: widget.backgroundBar,
                borderRadius: new BorderRadius.all(const Radius.circular(5.0))),
            child: new Container(
              decoration: new BoxDecoration(
                  color: widget.statusBar,
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(5.0))),
            ))
      ],
    ));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}