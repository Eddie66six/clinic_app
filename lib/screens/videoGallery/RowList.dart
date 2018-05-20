import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../../system.dart';

class RowList extends StatefulWidget {
  final String urlVideo;
  final String title;
  final String thumbnail;
  RowList(this.urlVideo, this.title, this.thumbnail);
  RowListState createState() => new RowListState();
}

class RowListState extends State<RowList>{
  @override
  Widget build(BuildContext context) {
    return (new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Stack(
          children: <Widget>[
            //card
            new _RowListCard(),
            //title
            new _RowListTitle(widget.title),
            //body
            new _RowListBody(widget.urlVideo, widget.thumbnail)
          ],
        )));
  }

}

class _RowListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 250.0,
      // margin: new EdgeInsets.only(left: 40.0),
      decoration: new BoxDecoration(
          color: SystemColors.SCHEDULES_CARD_BACKGROUND,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(2.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: SystemColors.SCHEDULES_CARD_SHADOW,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ]),
    ));
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
      // margin: new EdgeInsets.only(left: 40.0),
      padding: const EdgeInsets.all(10.0),
      alignment: FractionalOffset.topCenter,
      child: new Text(
        title,
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    ));
  }
}

class _RowListBody extends StatefulWidget {
  final String urlVideo;
  final String thumbnail;
  _RowListBody(this.urlVideo, this.thumbnail);

  @override
  _RowListBodyState createState() => new _RowListBodyState(); 
}

class _RowListBodyState extends State<_RowListBody> {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      height: 250.0,
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(color: Colors.transparent),
      margin: new EdgeInsets.only(top: 25.0),
      alignment: Alignment.center,
      child: new InkWell(
        onTap: (){
          FlutterYoutube.playYoutubeVideoByUrl(
            apiKey: "AIzaSyDXpkxbEGoyn0rMXcr0w3tfbR4VBqmMySc",
            videoUrl: widget.urlVideo
          );
        },
        child: new Stack(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: new Image(image: new NetworkImage(widget.thumbnail),),
          ),
          new Container(
            height: 200.0,
            alignment: Alignment.center,
            child: new Icon(Icons.play_circle_outline, size: 100.0,color: Colors.white,),
          )
        ],
      ) ,
      )
    ));
  }
}