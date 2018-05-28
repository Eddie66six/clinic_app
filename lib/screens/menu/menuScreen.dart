import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/menuItemModel.dart';
import '../../models/userModel.dart';
import '../../system.dart';
import '../clinicAbout/clinicAboutScreen.dart';
import '../login/loginScreen.dart';
import '../profile/profileScreen.dart';
import '../schedules/schedulesScreen.dart';
import '../specialty/specialtyScreen.dart';
import '../videoGallery/videoGalleryScreen.dart';

//para inserir um nome menu
//1 - apos criar pagina que vai ter no menu é nescessario registrala
//-> esse mesmo arquivo -> _getInstacePage
//2 - insira no array de config
//-> esse mesmo arquivo -> MenuScreen -> var menus

//first page to initialize
MenuScreenState menuScreenState = new MenuScreenState();
Size size;
Widget pageSelected = new SchedulesScreen(menus[selectedIndex],size, _scaffoldKey);
int selectedIndex = 0;
String title = 'Sobre';
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  MenuScreenState createState() => menuScreenState;
}

class MenuScreenState extends State<MenuScreen> {
  var menus = List<Widget>();
  var user = new UserModel('Mariana silva',
      'https://lh5.googleusercontent.com/-opcZrSeXrMQ/TYCdLJWMKbI/AAAAAAAAABs/0C3C3Li21x0/s1600/1.jpg');
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    if (menuScreenState.widget == null) {
      selectedIndex = 0;
      title = 'Sobre';
      return new Text('');
    }
    //generate menus
    _createMenus();
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
            key: _scaffoldKey,
            drawer: new Drawer(
                child: new Center(
                    child: new Container(
                        child: new Column(
                          children: <Widget>[
                          new HeaderMenu(),
                          //rows
                          new Expanded(
                            flex: 1,
                            child: new ListView(
                              padding: new EdgeInsets.all(0.0),
                              children: menus
                            ),
                          ),
            ])))),
            body: pageSelected));
  }
}

//register pages for menu
Widget _getInstacePage(Type type, Size size) {
  switch (type) {
    case ClinicAboutScreen:
      return new ClinicAboutScreen(menus[selectedIndex],size, _scaffoldKey);
    case SpecialtyScreen:
      return new SpecialtyScreen(menus[selectedIndex],size, _scaffoldKey);
    case ProfileScreen:
      return new ProfileScreen(menus[selectedIndex],size, _scaffoldKey);
    case SchedulesScreen:
      return new SchedulesScreen(menus[selectedIndex],size, _scaffoldKey);
    case VideoGalleryScreen:
      return new VideoGalleryScreen(size, _scaffoldKey);
    default:
      Navigator.pushAndRemoveUntil(
          menuScreenState.context,
          new MaterialPageRoute(builder: (context) => new LoginScreen()),
          (Route<dynamic> route) => true
        );
      menuScreenState = new MenuScreenState();
      return new SchedulesScreen(menus[selectedIndex],size, _scaffoldKey);
  }  
}

//create menus
void _createMenus() {
  if (menuScreenState.menus.length != menus.length) {
    var index = 0;
    for (var menu in menus) {
      menuScreenState.menus.add(new Column(children: <Widget>[
        new RowMenuItem(menu, index),
        new Container(height: 0.5, decoration: new BoxDecoration(color: Colors.grey[300]),)
      ],));
      index++;
    }
  }
}

//row for menu
class RowMenuItem extends StatefulWidget {
  RowMenuItem(this.menu, this.index);
  final MenuItemModel menu;
  final int index;
  @override
  RowMenuItemState createState() => new RowMenuItemState();
}

class RowMenuItemState extends State<RowMenuItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return (new Container(
      child: new InkWell(
          onTap: () {
            Navigator.pop(menuScreenState.context);
            menuScreenState.setState(() {
              selectedIndex = widget.index;
              title = widget.menu.title;
              pageSelected = _getInstacePage(widget.menu.pageType, size);
            });
          },
          child: new Container(
            padding: new EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
            decoration: new BoxDecoration(
                color: selectedIndex == widget.index
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
                  child: new Text(widget.menu.title, style: new TextStyle(color: const Color.fromARGB(255, 53, 88, 129)),),
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
        height: 230.0,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/perfilBackgroundMenu.png'),
            fit: BoxFit.cover
          ),
        ),
        child: new Container(
          margin: new EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Row(
                    children: <Widget>[
                      new Container(
                        height: 100.0,
                        width: 100.0,
                        margin: new EdgeInsets.only(left: 0.0, right: 10.0),
                        child: new CircleAvatar(
                          backgroundImage:
                              new NetworkImage(menuScreenState.user.urlImage),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: new EdgeInsets.only(bottom: 0.0),
                        alignment: Alignment.center,
                        child: new Text(menuScreenState.user.name, style: new TextStyle(fontSize: 18.0, color: Colors.white),),
                      ),
                      new Text('Proxima consulta dia',style: new TextStyle(color: Colors.white)),
                      new Text('05/08/2018',style: new TextStyle(color: Colors.white))
                        ],
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Text(''),
                      ),
                    ],
                ),
                new Container(
                  margin: new EdgeInsets.only(bottom: 5.0, top: 20.0),
                  padding: new EdgeInsets.only(left: 15.0),
                  decoration: new BoxDecoration(
                    color: const Color.fromARGB(30, 255, 255, 255),
                    borderRadius: new BorderRadius.circular(35.0)
                  ),
                  child: new TextField(
                    style: new TextStyle(color: Colors.white),
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      icon: new Icon(Icons.search, color: Colors.white,),
                      hintStyle: new TextStyle(color: Colors.white70),
                      hintText: 'Procurar...'
                    ),
                  ),
                )
              ],
        ))));
  }
}

//close app
Future<bool> _onWillPop() {
  return showDialog(
        context: menuScreenState.context, builder: (context) => new AlertDialog(
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

//config menus
final List<MenuItemModel> menus = <MenuItemModel>[
    new MenuItemModel('Minhas consultas', 'assets/images/schedulesIcon.png', SchedulesScreen, 'assets/images/profileHeaderBackground.png',null, null,0.0),
    new MenuItemModel('Especialidades', 'assets/images/specialtyIcon.png', SpecialtyScreen,'assets/images/specialtyHeaderBackground.png',
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text('Especialidades', style: new TextStyle(fontSize: 24.0, color: Colors.white,)),
          new Container(margin: new EdgeInsets.only(top: 15.0),),
          new Text('', style: new TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold)),
          new Container(
            margin: new EdgeInsets.only(top: 20.0),
            height: 150.0,
            width: 150.0,
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new AssetImage('assets/images/logo.png'),
            ),
          )
        ],
      ), 
    null,65.0),
    new MenuItemModel('Canal de saude', 'assets/images/movieIcon.png', VideoGalleryScreen, null, null, null,0.0),
    new MenuItemModel('Contatos', 'assets/images/aboutIcon.png', ClinicAboutScreen, null, null, null,0.0),
    new MenuItemModel('Perfil', 'assets/images/profileIcon.png', ProfileScreen, 'assets/images/profileHeaderBackground.png',
        new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text('Bem vindo(a)!', style: new TextStyle(fontSize: 24.0, color: Colors.white,)),
          new Container(margin: new EdgeInsets.only(top: 10.0),),
          new Text(menuScreenState.user.name, style: new TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold)),
          new Container(
            margin: new EdgeInsets.only(top: 20.0),
            height: 130.0,
            width: 130.0,
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(menuScreenState.user.urlImage),
            ),
          )
        ],
      ), 
    new Text(''),45.0),
    new MenuItemModel('Sair', 'assets/images/exit.png', null, null, null, null,0.0),
  ];