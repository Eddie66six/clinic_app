import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/menuItemModel.dart';
import '../../shared/customAppBar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this._menu, this.size,this._scaffoldKey);
  final MenuItemModel _menu;
  final Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new CustomAppBar(widget._menu, widget.size, widget._scaffoldKey,
    new Expanded(
      flex: 1,
        child: new GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(10.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <Widget>[
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/schedulesIcon.png'),),
                    new Container(
                      child: new Text('Consultas', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
                new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image(image: new AssetImage('assets/images/coracaoIcon.png'),),
                      new Container(
                        child: new Text('Resultados', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                      )
                    ],
                ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/specialtyIcon.png'),),
                    new Container(
                      child: new Text('Especialidades', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/maoEstrelaIcon.png'),),
                    new Container(
                      child: new Text('Novidades', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/movieIcon.png'),),
                    new Container(
                      child: new Text('Canal', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/msgIcon.png'),),
                    new Container(
                      child: new Text('Chat', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/aboutIcon.png'),),
                    new Container(
                      child: new Text('Contato', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/profileIcon.png'),),
                    new Container(
                      child: new Text('Perfil', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
            new CardProfile(widget.size,
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image(image: new AssetImage('assets/images/configIcon.png'),),
                    new Container(
                      child: new Text('Configuraçoes', style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
                    )
                  ],
              ),)
            ),
          ],
        ),
    ),'', logoSize: true,);
  }
}

class CardProfile extends StatefulWidget{
  final Size size;
  final Widget content;
  CardProfile(this.size, this.content);

  @override
  CardProfileState createState() => new CardProfileState();
}

class CardProfileState extends State<CardProfile>{
  var tapDown = false;
  @override
  Widget build(BuildContext context) {
    new Future.delayed(new Duration(microseconds: 300), (){
          setState(() {
              tapDown = false;
            });
          });
    return new GestureDetector(
      onTapDown: (_){ 
        setState(() {
          tapDown = true;
        });
      },
      child: new Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: tapDown == false ? Colors.white : Colors.grey[500],
          // shape: BoxShape.rectangle,
          //   boxShadow: <BoxShadow>[
          //     new BoxShadow(
          //         color: Colors.black45,
          //         blurRadius: 1.0,
          //         offset: new Offset(0.0, 2.0))
          //   ]
          ),
        width: widget.size.width/ 3 - 5,
        child: widget.content,
      ),
    );
  }

}
