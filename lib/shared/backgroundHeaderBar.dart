import 'package:flutter/material.dart';

class BackgroundHeaderBar extends StatelessWidget{
  final Widget _bodyPage;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final Size size;
  final String backgroundHeader;
  final double offsetBackgroundBottom;
  final Widget details;
  final Widget header;
  final Function function;
  final String title;
  final bool logoSize;
  BackgroundHeaderBar(
    this._bodyPage, this._scaffoldKey, this.size, this.backgroundHeader, this.offsetBackgroundBottom,
    this.details,this.header,this.logoSize,this.title,{this.function});
  @override
  Widget build(BuildContext context) {
    return (
      new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(bottom: 10.0),
              height: size.height/ (logoSize == true ? 3 : 4.0) + offsetBackgroundBottom,
              child: new Stack(
              children: <Widget>[
                new Container(
                  height: size.height/3,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage(backgroundHeader),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(top: 35.0),
                      alignment: Alignment.topLeft,
                      child: new IconButton(
                        icon: new Icon(_scaffoldKey != null ? Icons.dehaze : Icons.arrow_back, color: Colors.white),
                        onPressed: (){ 
                          _scaffoldKey != null ? _scaffoldKey.currentState.openDrawer() : Navigator.pop(context);
                        },
                      )
                    ),
                    header != null ? new Container(
                      width: size.width/ 1.3,
                      child: header,
                    ) : new Container(
                      margin: new EdgeInsets.only(top: 45.0, left: size.width/5.5),
                      child: new Text(title, style: new TextStyle(color: Colors.white, fontSize: 21.0),),
                    ),
                  ],
                ),
                details != null ?
                new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 1,
                      child: new Text('')
                    ),
                    new Container(
                      width: size.width/2 - 80,
                      margin: new EdgeInsets.only(bottom: 90.0, right: 5.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new Icon(Icons.date_range, color: Colors.white, size: 35.0,),
                          new Text('Proxima consulta', style: new TextStyle(color: Colors.white, fontSize: 11.0),),
                          new Text('dia 05/08/2018',style: new TextStyle(color: Colors.white, fontSize: 11.0),),
                        ],
                      )
                    )
                  ],
                ) : new Text(''),
                function != null ? new Container(
                  alignment: Alignment.topRight,
                  margin: new EdgeInsets.only(top: 50.0, right: 20.0, left: 100.0),
                  child: new InkWell(
                    onTap: (){
                      function();
                    },
                    child: new Icon(Icons.search, color: Colors.white),
                  )
                ): new Text(''),
              ],
            )
            ),
            //page
            _bodyPage
          ],
        )
    );
  }

}