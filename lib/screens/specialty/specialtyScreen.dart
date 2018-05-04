import 'package:flutter/material.dart';

class SpecialtyScreen extends StatefulWidget{
  @override
  SpecialtyScreenState createState() => new SpecialtyScreenState();
}

class SpecialtyScreenState extends State<SpecialtyScreen>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text("Especialidades"),
      ),
    );
  }

}