import 'dart:async';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../../models/schedulesModel.dart';
import '../../repository/testeRepository.dart';
import '../../systemLoading.dart';
import 'rowList.dart';

class SchedulesScreen extends StatefulWidget {
  SchedulesScreen(this.size);
  final Size size;
  @override
  SchedulesScreenState createState() => new SchedulesScreenState();
}

class SchedulesScreenState extends State<SchedulesScreen> {
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
      new List.generate(10, (index){
        schedulesList.add(new SchedulesModel(
          "http://moziru.com/images/iron-maiden-clipart-heavy-metal-5.jpg",
          new DateFormat("d/M/y")
              .add_Hm()
              .format(new DateTime.now())
              .toString(),
          'Mariana J. Duarte',
          'Nutricionista'));
      });
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
          itemCount: schedulesList.length,
          itemBuilder: (context, index) {
            return new RowList(
                schedulesList[index].urlImage,
                schedulesList[index].title,
                schedulesList[index].firstDescription,
                schedulesList[index].description);
          },
        ),
      ),
    );
  }
}
