import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/others/lineProgessBar.dart';
import '../../models/specialtyModel.dart';
import '../../repository/cepRepository.dart';
import '../../system.dart';
import '../../systemDialog.dart';
import '../../systemLoading.dart';

class SpecialtyScreen extends StatefulWidget {
  SpecialtyScreen(this.size);
  final Size size;
  @override
  SpecialtyScreenState createState() => new SpecialtyScreenState();
}

class SpecialtyScreenState extends State<SpecialtyScreen> {
  var list = List<SpecialtyModel>();

  Future<Null> _getSpecialty(String cep) async {
    var objCep = await new CepRepository().fetchCep(cep);
    setState(() {
      print(objCep);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration.zero, () {
      SystemLoading.onLoadingShow(context);
      _getSpecialty('18052601').then((result) {
        SystemLoading.onLoadingHide(context);
      }).catchError((erro) {
        SystemLoading.onLoadingHide(context);
        SystemDialog.openAlertDialog(context, widget.size.width, 'Erro');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Expanded(
        child: new SingleChildScrollView(
      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
      child: new Column(
        children: new List.generate(list.length, (index) {
          return new Container(
            margin: new EdgeInsets.only(bottom: 25.0),
            child: new LineProgessBar(
                size,
                list[index].percentage,
                list[index].text,
                SystemColors.PROGRESS_BAR_BACKGROUND,
                SystemColors.PROGRESS_BAR_STATUS),
          );
        }),
      ),
    ));
  }
}
