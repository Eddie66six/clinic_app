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
Widget pageSelected = new ClinicAboutScreen();
int selectedIndex = 0;
String title = 'Sobre';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  //config menus
  final List<MenuItemModel> menus = <MenuItemModel>[
    new MenuItemModel('Sobre', 'assets/images/aboutIcon.png', ClinicAboutScreen, null, null),
    new MenuItemModel('Especialidades', 'assets/images/specialtyIcon.png', SpecialtyScreen,
      'assets/images/specialtyHeaderBackground.png',
      new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Text('Conheça tudo que o INCAR', style: new TextStyle(color: Colors.white, fontSize: 24.0 ,fontWeight: FontWeight.normal)),
          new Center(child: new Text('faz por voçê!', style: new TextStyle(color: Colors.white, fontSize: 24.0 ,fontWeight: FontWeight.normal)),)
        ],
      )
    ),
    new MenuItemModel('Perfil', 'assets/images/profileIcon.png', ProfileScreen, null, null),
    new MenuItemModel('Horarios', 'assets/images/schedulesIcon.png', SchedulesScreen, null, null),
    new MenuItemModel('Galeria de videos', 'assets/images/schedulesIcon.png', VideoGalleryScreen, null, null),
    new MenuItemModel('Sair', 'assets/images/exit.png', null, null, null),
  ];

  @override
  MenuScreenState createState() => menuScreenState;
}

class MenuScreenState extends State<MenuScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var menus = List<Widget>();
  var user = new UserModel('Guilherme R. Souza',
      'https://whiplash.org/imagens-n/temp09/1434771134_08.jpg');
  @override
  Widget build(BuildContext context) {
    if (menuScreenState.widget == null) {
      reset();
      return new Text('');
    }
    var size = MediaQuery.of(context).size;
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
            body: new CustomAppBar(widget, size, _scaffoldKey)));
  }
}

//custom app bar
class CustomAppBar extends StatelessWidget {
  CustomAppBar(this.menuScreen, this.size, this._scaffoldKey);
  final MenuScreen menuScreen;
  final Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return (menuScreen.menus[selectedIndex].headerBackground != null
        ? new Column(
            children: <Widget>[
              new Container(
                height: size.height / 3.5,
                width: size.width,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(
                            menuScreen.menus[selectedIndex].headerBackground),
                        fit: BoxFit.fill)),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      padding: new EdgeInsets.only(top: 35.0),
                      alignment: Alignment.topLeft,
                      child: new IconButton(
                        icon: new Icon(Icons.dehaze),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      ),
                    ),
                    new Container (
                      height: size.height / 4,
                      width: size.width /1.2,
                      child: menuScreen.menus[selectedIndex].messageHeader ?? new Text('')
                      )
                  ],
                ),
              ),
              pageSelected
            ],
          )
        : new Column(
            children: <Widget>[
              new Container(
                decoration:
                    new BoxDecoration(color: SystemColors.PRIMARY_SWATCH),
                padding: new EdgeInsets.only(top: 30.0),
                alignment: Alignment.topLeft,
                child: new IconButton(
                  icon: new Icon(Icons.dehaze),
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),
              ),
              pageSelected
            ],
          ));
  }
}

//register pages for menu
Widget _getInstacePage(Type type, Size size) {
  switch (type) {
    case ClinicAboutScreen:
      return new ClinicAboutScreen();
    case SpecialtyScreen:
      return new SpecialtyScreen(size);
    case ProfileScreen:
      return new ProfileScreen(size);
    case SchedulesScreen:
      return new SchedulesScreen(size);
    case VideoGalleryScreen:
      return new VideoGalleryScreen(size);
    default:
      Navigator.pushAndRemoveUntil(
          menuScreenState.context,
          new MaterialPageRoute(builder: (context) => new LoginScreen()),
          (Route<dynamic> route) => true
        );
      menuScreenState = new MenuScreenState();
      return new Text('');
  }  
}

void reset() {
  pageSelected = new ClinicAboutScreen();
  selectedIndex = 0;
  title = 'Sobre';
}

//create menus
void _createMenus() {
  if (menuScreenState.menus.length != menuScreenState.widget.menus.length) {
    var index = 0;
    for (var menu in menuScreenState.widget.menus) {
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
