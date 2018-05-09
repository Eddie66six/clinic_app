import 'package:flutter/material.dart';

class SpecialtyScreen extends StatefulWidget{
  @override
  SpecialtyScreenState createState() => new SpecialtyScreenState();
}

class SpecialtyScreenState extends State<SpecialtyScreen>{
  @override
  Widget build(BuildContext context) {
    return  new Expanded(
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.2, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.5, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.1, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.8, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.8, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.8, backgroundColor: Colors.grey)
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 50.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('seila'),
                  new LinearProgressIndicator(value: 0.8, backgroundColor: Colors.grey)
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}