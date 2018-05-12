import 'dart:async';

import 'package:flutter/material.dart';
import '../../models/testeApiModel.dart';
import '../../repository/testeRepository.dart';
import '../../systemLoading.dart';

class SchedulesScreen extends StatefulWidget {
  SchedulesScreen(this.size);
  final Size size;
  @override
  SchedulesScreenState createState() => new SchedulesScreenState();
}

class SchedulesScreenState extends State<SchedulesScreen> {
  var cep = new TesteRepository();
  var lst = new List<TesteApiModel>();

  @override
    void initState(){
      // TODO: implement initState
      super.initState();
      new Future.delayed(Duration.zero, (){
        SystemLoading.onLoadingShow(context);
        _onRefresh().then((_){
          print('pronto');
          SystemLoading.onLoadingHide(context);
        });
      });
    }

  Future<Null> _onRefresh() async {
    var result = await new TesteRepository().fetchTeste();
    setState(() {
      lst = result;
      print('carregado..');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
          flex: 1,
          child: new RefreshIndicator(
            onRefresh: _onRefresh,
            child: new ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index){
                return new Center(child: new Text(lst[index].title));
              },
            ),
                      ),
                );
              }
}
