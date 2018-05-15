import 'package:flutter/material.dart';

import '../../system.dart';

class RowList extends StatelessWidget {
  final String urlImage;
  final String title;
  final String firstDescription;
  final String description;
  RowList(this.urlImage, this.title, this.firstDescription, this.description);
  @override
  Widget build(BuildContext context) {
    return (new Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: new Stack(
          children: <Widget>[
            //card
            new _RowListCard(),
            //image
            new _RowListImage(urlImage),
            //title
            new _RowListTitle(title),
            //body
            new _RowListBody(firstDescription, description)
          ],
        )));
  }
}

class _RowListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 120.0,
      margin: new EdgeInsets.only(left: 40.0),
      decoration: new BoxDecoration(
          color: SystemColors.SCHEDULES_CARD_BACKGROUND,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: SystemColors.SCHEDULES_CARD_SHADOW,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ]),
    ));
  }
}

class _RowListImage extends StatelessWidget {
  final urlImage;
  _RowListImage(this.urlImage);
  @override
  Widget build(BuildContext context) {
    return (new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0),
        alignment: FractionalOffset.centerLeft,
        child: new Container(
          height: 90.0,
          width: 90.0,
          child: new CircleAvatar(
            backgroundImage: new NetworkImage(
                urlImage
            ),
          ),
        )));
  }
}

class _RowListTitle extends StatelessWidget {
  final String title;
  _RowListTitle(this.title);
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 120.0,
      decoration: new BoxDecoration(color: Colors.transparent),
      margin: new EdgeInsets.only(left: 40.0),
      padding: const EdgeInsets.only(top: 10.0),
      alignment: FractionalOffset.topCenter,
      child: new Text(
        title,
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    ));
  }
}

class _RowListBody extends StatelessWidget {
  final String firstDescription;
  final String description;
  _RowListBody(this.firstDescription, this.description);
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 50.0,
      decoration: new BoxDecoration(color: Colors.transparent),
      margin: new EdgeInsets.only(left: 40.0, top: 40.0),
      alignment: Alignment.center,
      child: new Column(
        children: <Widget>[
          new Container(
              child: new Text(
            firstDescription,
            style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          )),
          new Container(
            child: new Text(
              description,
              style: new TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
    ));
  }
}
