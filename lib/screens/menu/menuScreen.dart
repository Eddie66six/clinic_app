import 'package:flutter/material.dart';

import '../../system.dart';
import '../clinicEnvelope/clinicAboutScreen.dart';
import '../specialty/specialtyScreen.dart';

class MenuScreen extends StatefulWidget {
  Widget pageSelected = new ClinicAboutScreen();
  int selectedIndex = 0;
  String title = 'Sobre';

  @override
  MenuScreenState createState() => new MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(widget.title),
        ),
        drawer: new Drawer(
            child: new Center(
                child: new Container(
                    child: new Column(children: <Widget>[
          new Container(
              height: 200.0,
              decoration: new BoxDecoration(
                color: SystemColors.TOP_MENU_BACKGROUND,
              ),
              child: new Center(
                  child: new Column(
                children: <Widget>[
                  new Container(
                    height: 100.0,
                    width: 100.0,
                    margin: new EdgeInsets.only(top: 40.0),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          "https://whiplash.org/imagens-n/temp09/1434771134_08.jpg"),
                    ),
                  ),
                  new Container(
                    padding: new EdgeInsets.all(20.0),
                    child: new Text("Guilherme Eddie"),
                  )
                ],
              ))),
          new Column(
            children: <Widget>[
              //sobre
              new Container(
                child: new InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        widget.pageSelected = new ClinicAboutScreen();
                        widget.selectedIndex = 0;
                        widget.title = 'Sobre';
                      });
                    },
                    child: new ItemMenu(widget.selectedIndex, 'assets/images/about.png', 'Sobre', 0)),
              ),
              //especialidades
              new Container(
                child: new InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        widget.pageSelected = new SpecialtyScreen();
                        widget.selectedIndex = 1;
                        widget.title = 'Especialidades';
                      });
                    },
                    child: new ItemMenu(widget.selectedIndex, 'assets/images/specialty.png', 'Especialidades',1)),
              ),
            ],
          ),
        ])))),
        body: widget.pageSelected);
  }
}

class ItemMenu extends StatelessWidget {
  ItemMenu(this.selectedIndex, this.icon, this.text, this.index);
  int selectedIndex;
  String icon;
  String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return (new Container(
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          color: selectedIndex == index
              ? SystemColors.SELECTED_MENU_BACKGROUND
              : Colors.transparent),
      child: new Row(
        children: <Widget>[
          new Container(
            child: new Image(
              image: new AssetImage(icon),
              height: 35.0,
              width: 35.0,
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(text),
          )
        ],
      ),
    ));
  }
}