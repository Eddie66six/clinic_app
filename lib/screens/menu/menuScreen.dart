import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/menuItemModel.dart';
import '../../models/userModel.dart';
import '../../system.dart';
import '../clinicAbout/clinicAboutScreen.dart';
import '../login/loginScreen.dart';
import '../specialty/specialtyScreen.dart';

//para inserir um nome menu
//1 - apos criar pagina que vai ter no menu é nescessario registrala
//-> esse mesmo arquivo -> _getInstacePage
//2 - insira no array de config
//-> esse mesmo arquivo -> MenuScreen -> var menus

MenuScreenState menuScreenState = new MenuScreenState();

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);
  //first page to initialize
  Widget pageSelected = new ClinicAboutScreen();
  int selectedIndex = 0;
  String title = 'Sobre';

  //config menus
  var menus = <MenuItemModel>[
    new MenuItemModel('Sobre', 'assets/images/about.png', ClinicAboutScreen),
    new MenuItemModel(
        'Especialidades', 'assets/images/specialty.png', SpecialtyScreen),
    new MenuItemModel('Sair', 'assets/images/exit.png', null),
  ];

  @override
  MenuScreenState createState() => menuScreenState;
}

class MenuScreenState extends State<MenuScreen> {
  var menus = List<Widget>();
  var user = new UserModel('Guilherme Eddie','https://whiplash.org/imagens-n/temp09/1434771134_08.jpg');
  @override
  Widget build(BuildContext context) {
    //generate menus
    _createMenus();
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
            appBar: new AppBar(
              title: Text(widget.title),
            ),
            drawer: new Drawer(
                child: new Center(
                    child: new Container(
                        child: new Column(children: <Widget>[
              new HeaderMenu(),
              //rows
              new Column(children: menus),
            ])))),
            body: widget.pageSelected));
  }
}

//register pages for menu
Widget _getInstacePage(Type type) {
  switch (type) {
    case ClinicAboutScreen:
      return new ClinicAboutScreen();
    case SpecialtyScreen:
      return new SpecialtyScreen();
    default:
      Navigator.pushAndRemoveUntil(
          menuScreenState.context,
          new MaterialPageRoute(builder: (context) => new LoginScreen()),
          (Route<dynamic> route) => false);
      //resete state
      menuScreenState = new MenuScreenState();
      return null;
  }
}

//create menus
void _createMenus() {
  if (menuScreenState.menus.length != menuScreenState.widget.menus.length) {
    var index = 0;
    for (var menu in menuScreenState.widget.menus) {
      menuScreenState.menus.add(new RowMenuItem(menu, index));
      index++;
    }
  }
}

//row for menu
class RowMenuItem extends StatefulWidget {
  RowMenuItem(this.menu, this.index);
  MenuItemModel menu;
  int index;
  @override
  RowMenuItemState createState() => new RowMenuItemState();
}

class RowMenuItemState extends State<RowMenuItem> {
  @override
  Widget build(BuildContext context) {
    return (new Container(
      child: new InkWell(
          onTap: () {
            Navigator.pop(menuScreenState.context);
            menuScreenState.setState(() {
              menuScreenState.widget.pageSelected =
                  _getInstacePage(widget.menu.pageType);
              menuScreenState.widget.selectedIndex = widget.index;
              menuScreenState.widget.title = widget.menu.title;
            });
          },
          child: new Container(
            padding: new EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
                color: menuScreenState.widget.selectedIndex == widget.index
                    ? SystemColors.SELECTED_MENU_BACKGROUND
                    : Colors.transparent),
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Image(
                    image: new AssetImage(widget.menu.icon),
                    height: 35.0,
                    width: 35.0,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 10.0),
                  child: new Text(widget.menu.title),
                )
              ],
            ),
          )),
    ));
  }
}

//header of menu
class HeaderMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (new Container(
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
                backgroundImage: new NetworkImage(menuScreenState.user.urlImage),
              ),
            ),
            new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Text(menuScreenState.user.name),
            )
          ],
        ))));
  }
}

//close app
Future<bool> _onWillPop() {
  return showDialog(
        context: menuScreenState.context,
        child: new AlertDialog(
          title: new Text('Deseja sair?'),
          content: new Text('O aplicativo sera fechado'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(menuScreenState.context).pop(false),
              child: new Text('Não'),
            ),
            new FlatButton(
              onPressed: () => exit(0),
              child: new Text('Sim'),
            ),
          ],
        ),
      ) ??
      false;
}
