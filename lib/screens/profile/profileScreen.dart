import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen(this.size);
  final Size size;
  @override
  ProfileScreenState createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          height: widget.size.height / 3,
          width: widget.size.width,
          decoration: new BoxDecoration(color: Colors.red),
          child: new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(20.0),
                height: 180.0,
                width: 180.0,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      'https://whiplash.org/imagens-n/temp09/1434771134_08.jpg'),
                ),
              ),
              new Center(
                child: new Text('Guilherme rodrigues souza', style: new TextStyle(fontSize: 18.0),),
              )
            ],
          ),
        ),
        new Container(
          child: new Text('dados'),
        )
      ],
    );
  }
}
