import 'package:flutter/material.dart';

import '../../models/menuItem.dart';
import '../../system.dart';
import '../clinicAbout/clinicAboutScreen.dart';
import '../specialty/specialtyScreen.dart';

MenuScreenState menuScreenState = new MenuScreenState();

class MenuScreen extends StatefulWidget {
  //first page to initialize
  Widget pageSelected = new ClinicAboutScreen();
  int selectedIndex = 0;
  String title = 'Sobre';

  //config menus
  var menus = <MenuItem>[
    new MenuItem('Sobre', 'assets/images/about.png', ClinicAboutScreen),
    new MenuItem(
        'Especialidades', 'assets/images/specialty.png', SpecialtyScreen),
    new MenuItem(
        'erro', 'assets/images/specialty.png', null),
  ];

  @override
  MenuScreenState createState() => menuScreenState;
}
class MenuScreenState extends State<MenuScreen> {
  var menus = List<Widget>();
  @override
  Widget build(BuildContext context) {
    //generate menus
    _createMenus();
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
            //rows
            new Column(children: menus),
        ])))),
        body: widget.pageSelected);
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
      return (new Center(child: new Text("Pagina não encontrada")));
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

class RowMenuItem extends StatefulWidget {
  RowMenuItem(this.menu, this.index);
  MenuItem menu;
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
