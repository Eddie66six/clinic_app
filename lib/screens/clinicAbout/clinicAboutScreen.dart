import 'package:flutter/material.dart';

class ClinicAboutScreen extends StatefulWidget{
  @override
  ClinicAboutScreenState createState() => new ClinicAboutScreenState();
}

class ClinicAboutScreenState extends State<ClinicAboutScreen>{
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView(
        children: new List.generate(50, (index){
          return new Center(
            child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Text('index $index'),
            ),
          );
        })
      ),
    );
  }

}