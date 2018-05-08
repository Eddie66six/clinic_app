import 'package:flutter/material.dart';

class NormalInput extends StatelessWidget {
  NormalInput({Key key, this.hintText, this.isPassword = false, this.controller})
      : super(key: key);
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return (
      new Container(
        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
        child: new TextField(
          controller: this.controller,
          obscureText: isPassword,
          decoration: new InputDecoration(
            hintText: this.hintText
          ),
        ),
      )
    );
  }
}
