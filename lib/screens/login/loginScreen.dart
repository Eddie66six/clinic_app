import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/buttons/roundedButton.dart';
import '../../components/inputs/containerInput.dart';
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
  var focusNode = new FocusNode();
  var focusNode1 = new FocusNode();
  var _scrollController = new ScrollController();

  Future<Null> _login(String cep) async {
    var objCep = await new CepRepository().fetchCep(cep);
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      focusNode.addListener(_onFocus);
      focusNode1.addListener(_onFocus);
  }

   @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(_onFocus);
    focusNode1.removeListener(_onFocus);
  }

  void _onFocus(){
    new Future.delayed(new Duration(milliseconds: 750), (){
      for (var i = 0; i < 100; i++) {
      _scrollController.animateTo(60.0 * 1, duration: new Duration(milliseconds: 50), curve: Curves.ease); 
      }
    });
  }

  var manterConectado = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      body: new SingleChildScrollView(
        controller: _scrollController,
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
          height: size.height,
          padding: new EdgeInsets.only(left: 35.0,right: 35.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //logo
              new Container(
                  margin: new EdgeInsets.only(bottom: 30.0, top: 35.0),
                  decoration: new BoxDecoration(),
                  child: new Image(
                    image: new AssetImage('assets/images/logo.png'),
                    height: 130.0,
                    width: 130.0,
                  )),
                //form
              new ContainerInput('Digite seu CPF',size.width, cpfController, focusNode: focusNode1),
              new Container(margin: new EdgeInsets.all(5.0),),
              new ContainerInput('Senha',size.width, passwordController, focusNode: focusNode, isPassword: true,),
              new Container(
                margin: new EdgeInsets.only(bottom: 20.0, top: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: new BoxDecoration(
                        //color: const Color.fromARGB(255, 30, 96, 238),
                        borderRadius: new BorderRadius.circular(8.0)
                      ),
                      child: new Checkbox(value: manterConectado, onChanged: (value){
                        setState(() {
                          manterConectado = !manterConectado;                        
                        });
                      })
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
                screenWidthSize: size.width/ 1.7,
                typeSize: EnumTypeSize.BIG,
                color: const Color.fromARGB(255, 30, 96, 238),
                fontColor: Colors.white,
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
              //esqueceu a senha
              new Container(
                margin: new EdgeInsets.only(top: 5.0),
                child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {},
                    child: new Text("Esqueceu sua senha?", style: new TextStyle(color: Colors.white, fontSize: 15.0),),
                  ),
                ],
              )
              ),
              //divisor
              new Container(
                margin: new EdgeInsets.only(top: 30.0),
                height: 0.5, decoration: new BoxDecoration(color: Colors.white),),
              new Container(
                child: new FlatButton(
                  onPressed: (){},
                  child: new Text('Registre-se', style: new TextStyle(fontSize: 21.0, color: Colors.white),)
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}