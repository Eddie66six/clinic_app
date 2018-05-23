import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/buttons/primaryButton.dart';
import '../../components/buttons/roundedButton.dart';
import '../../components/inputs/containerInput.dart';
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
            fit: BoxFit.fill
          )
        ),
        child: new Container(
          padding: new EdgeInsets.all(35.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //logo
              new Container(
                  margin: new EdgeInsets.only(bottom: 40.0, top: 35.0),
                  decoration: new BoxDecoration(),
                  child: new Image(
                    image: new AssetImage('assets/images/loginLogo.png'),
                    height: 130.0,
                    width: 130.0,
                  )),
                //form
              new ContainerInput('Digite seu CPF',size.width),
              new Container(margin: new EdgeInsets.all(5.0),),
              new ContainerInput('Senha',size.width),
              new Container(
                margin: new EdgeInsets.only(bottom: 15.0, top: 10.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: new BoxDecoration(
                        color: const Color.fromARGB(255, 30, 96, 238),
                        borderRadius: new BorderRadius.circular(8.0)
                      ),
                      child: new Checkbox(value: true, onChanged: (value){})
                    ),
                    new Container(
                      margin: new EdgeInsets.only(left: 10.0),
                      child: new Text('Mantenha-me conectado', style: new TextStyle(fontSize: 21.0, color: Colors.white),)
                    )
                  ],
                ),
              ),
              new RoundedButton(
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
              new Container(
                margin: new EdgeInsets.only(top: 15.0),
                child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    child: new Text("Esquceu sua senha?", style: new TextStyle(color: Colors.white, fontSize: 15.0),),
                  ),
                ],
              )
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}