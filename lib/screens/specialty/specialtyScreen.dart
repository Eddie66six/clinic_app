import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/menuItemModel.dart';
import '../../models/specialtyModel.dart';
import '../../repository/cepRepository.dart';
import '../../shared/customAppBar.dart';
import '../../systemDialog.dart';
import '../../systemLoading.dart';

class SpecialtyScreen extends StatefulWidget {
  SpecialtyScreen(this._menu,this.size, this._scaffoldKey);
  final MenuItemModel _menu;
  final Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  SpecialtyScreenState createState() => new SpecialtyScreenState();
}

class SpecialtyScreenState extends State<SpecialtyScreen> {
  var specialtyList = List<SpecialtyModel>();

  Future<Null> _getSpecialty(String cep) async {
    var objCep = await new CepRepository().fetchCep(cep);
    setState(() {
      new List.generate(10, (index){
        specialtyList.add(new SpecialtyModel('seila ' + index.toString(), new Random().nextDouble() * 100));
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration.zero, () {
      SystemLoading.onLoadingShow(context);
      _getSpecialty('18052601').then((result) {
        SystemLoading.onLoadingHide(context);
      }).catchError((erro) {
        SystemLoading.onLoadingHide(context);
        SystemDialog.openAlertDialog(context, widget.size.width, 'Erro');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;

  var funcoes = <String>[
    'Anestesiologia',
    'Angiologia',
    'Bucomaxilo',
    'Cardiologia',
    'Cirurgia geral',
    'Endcronologia',
    'Fonoaudiologia'
  ];

  var list = List<ItemAccordion>();
  for (var funcao in funcoes) {
    list.add(
      new ItemAccordion(
      funcao,
      <SubItemAccordion>[
        new SubItemAccordion(
        'Dra. Maria silva',
        new SubItemBodyAccordion(
          'https://st.depositphotos.com/1144472/4544/i/950/depositphotos_45440125-stock-photo-female-doctor-showing-blank-clipboard.jpg',
          'Dra. Maria silva', funcao, 'CRM 0000000')),
        new SubItemAccordion(
        'Dr. João gustavo',
        new SubItemBodyAccordion(
          'http://www.canon.com.br/upload/geral/150825075003_area-medica.jpg',
          'Dr. João gustavo', funcao, 'CRM 0000000')),
        new SubItemAccordion(
        'Dra. Amanda souza',
        new SubItemBodyAccordion(
          'http://orthofono.com.br/sitenovo/wp-content/uploads/2016/07/mulher.png',
          'Dra. Amanda souza', funcao, 'CRM 0000000'))
      ],
      )
    );   
  }

  //create
  var mainList = new List<Widget>();
  for (var main in list) {
    var bodyList = new List<Widget>();
    for (var body in main.subItem) {
      bodyList.add(new Accordion(body.title, new BodySubAccordion(size,body.subItemBody), isSubItem: true,));
    }
    mainList.add(new Accordion(main.title, new Column(children: bodyList,)));
  }

  return new CustomAppBar(widget._menu, widget.size, widget._scaffoldKey,
    new  Expanded(
      child: new ListView(
        padding: new EdgeInsets.all(0.0),
        children: mainList
      )
    ),
    null, logoSize: true,);
  }
}

class Accordion extends StatefulWidget{
  final String title;
  final Widget body;
  final bool isSubItem;
  Accordion(this.title,this.body,{this.isSubItem = false});
  @override
  AccordionState createState() => new AccordionState();
}
class AccordionState extends State<Accordion>{
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return (
      //title
      new Column(
        children: <Widget>[
          new GestureDetector(
            onTapDown: (_){
              setState(() {
                isExpanded = !isExpanded;                
              });
            },
            child: new Container(
              margin: widget.isSubItem ? new EdgeInsets.only(left: 30.0, right: 30.0) : new EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: new BoxDecoration(color: Colors.transparent),
              child: new Row(
                children: <Widget>[
                  new Icon(isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  new Container(
                    child: new Container(
                      margin: new EdgeInsets.all(10.0),
                      child: new Text(widget.title, style: new TextStyle(fontSize: 21.0),),),
                  )
                ],
              ),
            )
          ),
          new Container(height: 0.5, decoration: new BoxDecoration(color: Colors.grey[500])),
          isExpanded ? widget.body : new Container()
        ],
      )
    );
  }

}

class BodySubAccordion extends StatelessWidget{
  BodySubAccordion(this.size,this.body);
  final Size size;
  final SubItemBodyAccordion body;
  @override
  Widget build(BuildContext context) {
    return (
      new Column(
          children: <Widget>[
            new Container(
              height: 200.0, width: size.width/ 1.2,
              child: new Column(
                children: <Widget>[
                  //detalhes
                  new Container(
                    height: 150.0,
                    padding: new EdgeInsets.all(10.0),
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          height: 130.0,
                          width: 130.0,
                          child: new CircleAvatar(
                            backgroundImage: new NetworkImage(body.image),
                          ),
                        ),
                        new Container(
                          width: size.width/ 1.2 - 150,
                          padding: new EdgeInsets.only(left: 20.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                child: new Text(body.name, style: new TextStyle(fontSize: 24.0)),
                              ),
                              new Container(
                                margin: new EdgeInsets.only(top: 5.0),
                                child: new Text(body.specialty, style: new TextStyle(color: Colors.grey[500], fontSize: 18.0),),
                              ),
                              new Container(
                                margin: new EdgeInsets.only(top: 5.0),
                                child: new Text(body.other, style: new TextStyle(color: Colors.grey[500], fontSize: 18.0)),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  ),
                  //rede social
                  new Row(
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: size.width / 10,
                        child: new Image(image: new NetworkImage('https://png.icons8.com/color/1600/twitter-squared.png'),),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: size.width / 10,
                        child: new Image(image: new NetworkImage('https://pre00.deviantart.net/0eed/th/pre/i/2012/160/9/7/youtube_icon___recreation_by_izyarts-d52tyrb.jpg'),),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: size.width / 10,
                        child: new Image(image: new NetworkImage('https://imagepng.org/wp-content/uploads/2017/09/facebook-icone-icon.png'),),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: size.width / 10,
                        child: new Image(image: new NetworkImage('https://cdn1.iconfinder.com/data/icons/logotypes/32/square-linkedin-512.png'),),
                      ),
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        height: size.width / 10,
                        child: new Image(image: new NetworkImage('http://pluspng.com/img-png/instagram-png-file-instagram-icon-png-599.png'),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
    );
  }

}

class ItemAccordion{
  ItemAccordion(this.title,this.subItem);
  String title;
  List<SubItemAccordion> subItem;
}
class SubItemAccordion{
  SubItemAccordion(this.title, this.subItemBody);
  String title;
  SubItemBodyAccordion subItemBody;
}
class SubItemBodyAccordion{
  SubItemBodyAccordion(this.image,this.name,this.specialty,this.other);
  String image;
  String name;
  String specialty;
  String other;
}