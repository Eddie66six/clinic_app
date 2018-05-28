import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../components/others/lineProgessBar.dart';
import '../../models/menuItemModel.dart';
import '../../models/specialtyModel.dart';
import '../../repository/cepRepository.dart';
import '../../shared/customAppBar.dart';
import '../../system.dart';
import '../../systemDialog.dart';
import '../../systemLoading.dart';

class SpecialtyScreen extends StatefulWidget {
  SpecialtyScreen(this._menu,this.size, this._scaffoldKey);
  final MenuItemModel _menu;
  final Size size;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  SpecialtyScreenState createState() => new SpecialtyScreenState();
}

class SpecialtyScreenState extends State<SpecialtyScreen> {
  var specialtyList = List<SpecialtyModel>();

  Future<Null> _getSpecialty(String cep) async {
    var objCep = await new CepRepository().fetchCep(cep);
    setState(() {
      new List.generate(10, (index){
        specialtyList.add(new SpecialtyModel('seila ' + index.toString(), new Random().nextDouble() * 100));
      });
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
    return new CustomAppBar(widget._menu, widget.size, widget._scaffoldKey,
    new Expanded(
        child: new SingleChildScrollView(
      padding: new EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
      child: new Column(
        children: new List.generate(specialtyList.length, (index) {
          return new Container(
            margin: new EdgeInsets.only(bottom: 25.0),
            child: new LineProgessBar(
                size,
                specialtyList[index].percentage,
                specialtyList[index].text,
                SystemColors.PROGRESS_BAR_BACKGROUND,
                SystemColors.PROGRESS_BAR_STATUS),
          );
        }),
      ),
    )),null, logoSize: true,);
  }
}
