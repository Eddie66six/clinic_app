import 'package:flutter/material.dart';
class ContainerInput extends StatelessWidget{
  ContainerInput(this.hintText, this.widthScreen, this.controller,{this.focusNode});
  String hintText;
  double widthScreen;
  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return (
      new Container(
        width: widthScreen,
        margin: new EdgeInsets.only(bottom: 5.0),
        decoration: new BoxDecoration(
          color: const Color.fromARGB(30, 255, 255, 255),
          borderRadius: new BorderRadius.circular(35.0)
        ),
        child: new Container(
          padding: new EdgeInsets.only(top: 5.0, bottom: 5.0, left: 35.0),
          child: new TextField(
          controller: controller,
          focusNode: focusNode,
          style: new TextStyle(color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w400),
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintStyle: new TextStyle(color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w400),
            hintText: hintText
          ),
        ),
        )
      )
    );
  }
}