import 'package:flutter/material.dart';

class DefaultHeaderBar extends StatelessWidget{
  final Widget _bodyPage;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Function function;
  final String title;
  DefaultHeaderBar(this._bodyPage, this._scaffoldKey, this.function, this.title);
  @override
  Widget build(BuildContext context) {
    return (
      new Column(
            children: <Widget>[
              new Container(
                decoration:
                    new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/images/simpleBackgroundHeaderBar.png'),
                        fit: BoxFit.fill
                      )
                    ),
                padding: new EdgeInsets.only(top: 30.0),
                alignment: Alignment.topLeft,
                child: new Row(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.dehaze, color: Colors.white),
                      onPressed: () => _scaffoldKey.currentState.openDrawer(),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Center(
                        child: new Text(title, style: new TextStyle(color: Colors.white, fontSize: 21.0),),
                      )
                    ),
                    function != null ? new IconButton(
                      icon: new Icon(Icons.search, color: Colors.white,),
                      onPressed: () => function(),
                    ): new Text(''),
                  ],
                )
              ),
              _bodyPage
            ],
          )
    );
  }

}