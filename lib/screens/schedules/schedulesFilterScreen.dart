import 'package:flutter/material.dart';

import '../../components/buttons/roundedButton.dart';
import '../../models/menuItemModel.dart';
import '../../shared/customAppBar.dart';

class SchedulesFilterScreen extends StatefulWidget{
  final Size _size;
  SchedulesFilterScreen(this._size);
  @override
  SchedulesFilterScreenState createState() => new SchedulesFilterScreenState();
}
class SchedulesFilterScreenState extends State<SchedulesFilterScreen>{
  @override
  Widget build(BuildContext context) {
    double height = widget._size.height - (widget._size.height / 3);
    var widthCard = widget._size.width/ 2.2;
    var page = new Container(
      width: widget._size.width,
      child: new Column(
        children: <Widget>[
          new Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new CardSchedulesFilter(widthCard,height/4.5, '10/05/2018', 'Melhor data','assets/images/schedulesIcon.png'),
               new CardSchedulesFilter(widthCard,height/4.5,'09:00', 'Melhor horario','assets/images/clockIcon.png')
            ],
          ),
          new Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new CardSchedulesFilter(widthCard,height/4.5, '-', 'Convenio','assets/images/houseIcon.png'),
               new CardSchedulesFilter(widthCard,height/4.5,'Planserv', 'Plano de saude','assets/images/carIcon.png')
            ],
          ),
          new Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new CardSchedulesFilter(widthCard,height/4.5, 'Cardiologia','Especialidade','assets/images/specialtyIcon.png'),
               new CardSchedulesFilter(widthCard,height/4.5, 'Dr.Artur Gonzales','Profissionais','assets/images/seilaIcon.png')
            ],
          ),
          new Container(margin: new EdgeInsets.only(top: 20.0),),
          new RoundedButton(text: 'Confirmar', screenWidthSize: widget._size.width / 1.5,
            typeSize: EnumTypeSize.SMALL, color: const Color.fromARGB(255, 30, 96, 238), fontColor: Colors.white,),
          new Container(margin: new EdgeInsets.only(top: 10.0),),
          new RoundedButton(text: 'Minhas consultas', screenWidthSize: widget._size.width / 1.5,
            typeSize: EnumTypeSize.SMALL, fontColor: Colors.grey,color: Colors.transparent,),
        ],
      ),
    );
    return (
      new Scaffold(
        backgroundColor: Colors.white,
        body: new CustomAppBar(new MenuItemModel('', '', null, 'assets/images/schedulesFilterHeaderBackground.png',null, null,0.0),widget._size, null, page, 'Agendar consulta')
      )
    );
  }
}

class CardSchedulesFilter extends StatelessWidget{
  final double width;
  final double height;
  final String textbutton;
  final String title;
  final String icon;
  CardSchedulesFilter(this.width,this.height, this.textbutton, this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: height,
      margin: new EdgeInsets.all(5.0),
      padding: new EdgeInsets.all(5.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Image(
                image: new AssetImage(icon),
                height: 30.0,
              ),
              new Container(
                margin: new EdgeInsets.only(left: 5.0),
                child: new Text(title, style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
              )
            ],
          ),
          new Container(margin: new EdgeInsets.only(top: 10.0),),
          new RoundedButton(text: textbutton, screenWidthSize: width,
                  typeSize: EnumTypeSize.MEDIUM, fontColor: Colors.grey,color: Colors.transparent)
        ],
      ),
    );
  }

}