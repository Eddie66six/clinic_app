import 'package:flutter/material.dart';

import '../../components/buttons/primaryButton.dart';
import '../../components/inputs/normalInput.dart';
import '../../services/cepService.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Container(
        height: size.height,
        decoration: new BoxDecoration(color: Colors.white),
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
                    var cep = new Cep();
                    cep.getAdress('18052601').then((result){
                        print(result.data);
                        SystemLoading.onLoadingHide(context);
                        if(!result.error)
                          Navigator.pushAndRemoveUntil(context,new MaterialPageRoute(builder: (context) => new MenuScreen()),(Route<dynamic> route) => false);
                        else{
                          SystemDialog.openAlertDialog(context,size.width, result.data);
                        }
                      }
                    ).catchError((error){
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
                    child: new Text("Primeiro acesso"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}