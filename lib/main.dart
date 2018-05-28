import 'package:clinic_app/system.dart';
import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

import 'splashScreen.dart';

void main(){
  MapView.setApiKey('AIzaSyDXpkxbEGoyn0rMXcr0w3tfbR4VBqmMySc');
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: SystemColors.PRIMARY_SWATCH,
      ),
      home: new SplashScreen(),
    );
  }
}