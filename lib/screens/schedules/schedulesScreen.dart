import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../../models/menuItemModel.dart';
import '../../models/schedulesModel.dart';
import '../../repository/testeRepository.dart';
import '../../shared/customAppBar.dart';
import '../../systemLoading.dart';
import 'rowList.dart';
import 'schedulesFilterScreen.dart';

class SchedulesScreen extends StatefulWidget {
  SchedulesScreen(this._menu, this.size,this._scaffoldKey);
  final MenuItemModel _menu;
  final Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  SchedulesScreenState createState() => new SchedulesScreenState();
}

class SchedulesScreenState extends State<SchedulesScreen> {
  DateTime _fromDate = new DateTime.now();
  var cep = new TesteRepository();
  var schedulesList = new List<SchedulesModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration.zero, () {
      SystemLoading.onLoadingShow(context);
      _onRefresh().then((_) {
        print('pronto');
        SystemLoading.onLoadingHide(context);
      });
    });
  }

  Future<Null> _onRefresh() async {
    var result = await new TesteRepository().fetchTeste();
    setState(() {
      new List.generate(10, (index) {
        schedulesList.add(new SchedulesModel(
            "https://st2.depositphotos.com/1006318/5909/v/950/depositphotos_59095203-stock-illustration-medical-doctor-profile.jpg",
            new DateFormat("d/M/y")
                .add_Hm()
                .format(new DateTime.now())
                .toString(),
            'Mario J. Duarte',
            'Nutricionista'));
      });
      print('carregado..');
    });
  }

  void _filter(){
    Navigator.push(context,new MaterialPageRoute(builder: (context) => new SchedulesFilterScreen(widget.size)));
  }

  @override
  Widget build(BuildContext context) {
    return new CustomAppBar(null, widget.size, widget._scaffoldKey,
    new Expanded(
        flex: 1,
        child: new Column(
          children: <Widget>[
            //list
            new Expanded(
              flex: 1,
              child: new RefreshIndicator(
                onRefresh: _onRefresh,
                child: new ListView.builder(
                  itemCount: schedulesList.length,
                  itemBuilder: (context, index) {
                    return new Column(
                      children: <Widget>[
                        new RowList(
                        schedulesList[index].urlImage,
                        schedulesList[index].title,
                        schedulesList[index].firstDescription,
                        schedulesList[index].description),
                        new Container(
                          height: 1.0,
                          decoration: new BoxDecoration(
                            color: Colors.grey[500]
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        )
    ),'Minhas consultas',function: _filter);
  }
}