import 'dart:async';

import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class ClinicAboutScreen extends StatefulWidget{
  @override
  ClinicAboutScreenState createState() => new ClinicAboutScreenState();
}

class ClinicAboutScreenState extends State<ClinicAboutScreen>{
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider('AIzaSyDXpkxbEGoyn0rMXcr0w3tfbR4VBqmMySc');
  Uri staticMapUri;

  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(new Location(-23.504143, -47.549138), 2.0);
    staticMapUri = staticMapProvider.getStaticUri(new Location(-23.504143, -47.549138), 16, width: 600, height: 400, mapType: StaticMapViewType.roadmap);
    new Future.delayed(Duration.zero, (){
      mapView.addMarker(new Marker("3", "10 Barrel", -23.504143, -47.549138));
      mapView.zoomToFit(padding: 100);
    });
  }

  void showMap() {
    mapView.show(new MapOptions(showUserLocation: true));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          child:new Image.network(staticMapUri.toString())
        )
      ],
    );
  }
}