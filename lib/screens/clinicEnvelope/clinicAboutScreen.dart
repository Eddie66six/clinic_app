import 'package:flutter/material.dart';

class ClinicAboutScreen extends StatefulWidget{
  @override
  ClinicAboutScreenState createState() => new ClinicAboutScreenState();
}

class ClinicAboutScreenState extends State<ClinicAboutScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Sobre"),
      ),
    );
  }

}