import 'dart:async';

import 'package:clinic_app/screens/login/loginScreen.dart';
import 'package:clinic_app/screens/menu/menuScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  SplashScreenState createState() => new SplashScreenState();

}
class SplashScreenState extends State<SplashScreen>{
  startTime() async {
    return new Timer(new Duration(seconds: 2) ,(){
      Navigator.pushAndRemoveUntil(context,
      new MaterialPageRoute(builder: (context) => 1== 1 ? new LoginScreen() : new MenuScreen()),
      (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/images/splashScreen.png'),
            fit: BoxFit.fill
          )
        ),
      ),
    );
  }

}