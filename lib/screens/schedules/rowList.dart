import 'package:flutter/material.dart';

import '../../components/buttons/roundedButton.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
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
      height: 150.0,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
      ),
    ));
  }
}

class _RowListImage extends StatelessWidget {
  final urlImage;
  _RowListImage(this.urlImage);
  @override
  Widget build(BuildContext context) {
    return (new Container(
        margin: new EdgeInsets.symmetric(vertical: 25.0),
        padding: new EdgeInsets.only(right: 0.0),
        alignment: FractionalOffset.centerRight,
        child: new Container(
          height: 100.0,
          width: 100.0,
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
      margin: new EdgeInsets.only(left: 10.0),
      padding: const EdgeInsets.only(top: 10.0),
      alignment: FractionalOffset.topLeft,
      child: new Row(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(right: 10.0),
            child: new Image(
              image: new AssetImage('assets/images/schedulesIcon.png'),
              height: 30.0,
            ),
          ),
          new Text(
            title,
            style: new TextStyle(fontSize: 21.0),
          ),
        ],
      )
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
      height: 110.0,
      decoration: new BoxDecoration(color: Colors.transparent),
      margin: new EdgeInsets.only(left: 10.0, top: 40.0),
      alignment: Alignment.topLeft,
      child: new Column(
        children: <Widget>[
          //nome
          new Container(
            alignment: Alignment.topLeft,
              child: new Text(
            firstDescription,
            style: new TextStyle(fontSize: 18.0),
          )),
          //especialidades
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              description,
              style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
          ),
          //cnr
          new Container(
            alignment: Alignment.topLeft,
            child: new Text(
              'CRM 00000000000',
              style: new TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
          ),
          //botoes
          new Container(
            margin: new EdgeInsets.only(top: 5.0),
            child: new Row(
            children: <Widget>[
              new RoundedButton(
                text: "Ligar",
                screenWidthSize: 110.0,
                typeSize: EnumTypeSize.SMALL,
                color: const Color.fromARGB(255, 30, 96, 238),
                fontColor: Colors.white,
                tap: (){},
              ),
              new Container(margin: new EdgeInsets.only(right: 5.0),),
              new RoundedButton(
                text: "Cancelar",
                screenWidthSize: 110.0,
                typeSize: EnumTypeSize.SMALL,
                color: const Color.fromARGB(255, 255, 0, 0),
                fontColor: Colors.white,
                tap: (){},
              ),
            ],
          )
          )
        ],
      ),
    ));
  }
}
