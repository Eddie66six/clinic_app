import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/buttons/primaryButton.dart';
import '../../components/inputs/normalInput.dart';
import '../../repository/cepRepository.dart';
import '../../systemDialog.dart';
import '../../systemLoading.dart';
import '../menu/menuScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController cpfController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future<Null> _login(String cep) async {
    var objCep = await new CepRepository().fetchCep(cep);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      body: new SingleChildScrollView(
        physics: new NeverScrollableScrollPhysics(),
        child: new Container(
        height: size.height,
        decoration: new BoxDecoration(
          color: Colors.transparent,
          image: new DecorationImage(
            image: new AssetImage('assets/images/loginBackground.png'),
            fit: BoxFit.cover
          )
        ),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Container(
                  decoration: new BoxDecoration(),
                  margin: new EdgeInsets.only(top: 35.0),
                  child: new Image(
                    image: new AssetImage('assets/images/loginLogo.png'),
                    height: 160.0,
                    width: 160.0,
                  )),
              new NormalInput(
                hintText: "CPF",
                controller: cpfController,
              ),
              new NormalInput(
                hintText: "SENHA",
                isPassword: true,
                controller: passwordController,
              ),
              new PrimaryButton(
                text: "Entrar",
                screenWidthSize: size.width,
                tap: () {
                  if (cpfController.text == null || cpfController.text == "" || passwordController.text == null || passwordController.text == "") {
                    SystemDialog.openAlertDialog(context,size.width, 'Dados Não encontrados');
                  } else {
                    SystemLoading.onLoadingShow(context);
                    _login('18052601').then((result){
                        if(result == null)
                          Navigator.pushAndRemoveUntil(context,new MaterialPageRoute(builder: (context) => new MenuScreen()),(Route<dynamic> route) => false);
                        else{
                          SystemLoading.onLoadingHide(context);
                          SystemDialog.openAlertDialog(context,size.width, 'Ocorreu um erro!');
                        }
                    }).catchError((erro){
                      SystemLoading.onLoadingHide(context);
                      SystemDialog.openAlertDialog(context,size.width, 'Erro');
                    });
                  }
                },
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    child: new Text("Primeiro acesso?"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}