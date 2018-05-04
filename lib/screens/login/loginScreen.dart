import 'package:flutter/material.dart';

import '../../components/buttons/alertButton.dart';
import '../../components/buttons/primaryButton.dart';
import '../../components/inputs/normalInput.dart';
import '../../system.dart';
import '../clinicEnvelope/clinicAboutScreen.dart';
import '../menu/menuScreen.dart';

class LoginScreen extends StatefulWidget {
  // LoginScreen({Key key, this.title}) : super(key: key);
  // final String title;
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
                  margin: new EdgeInsets.only(top: 40.0),
                  child: new Image(
                    image: new AssetImage('assets/images/loginLogo.png'),
                    height: 170.0,
                    width: 170.0,
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
                  if (cpfController.text == null ||
                      cpfController.text == "" ||
                      passwordController.text == null ||
                      passwordController.text == "") {
                    showDialog(
                        context: context,
                        child: new AlertDialog(
                            title: new Text("Dados não encontrados"),
                            content: new AlertButton(
                              text: "OK",
                              screenWidthSize: size.width,
                              tap: () {
                                Navigator.pop(context);
                              },
                            )));
                  } else {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MenuScreen()),
                    );
                  }
                },
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    child: new Text("Ainda não tem cadastro? Click aqui"),
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
