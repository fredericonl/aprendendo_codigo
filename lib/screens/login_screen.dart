import 'package:entendo_codigo/helpers/validators.dart';
import 'package:entendo_codigo/models/page_manager.dart';
import 'package:entendo_codigo/models/user.dart';
import 'package:entendo_codigo/models/user_manager.dart';
import 'package:entendo_codigo/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  User user;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Entrar',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/criarConta');
              },
              child: Text(
                'CRIAR CONTA',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Card(
            margin: EdgeInsets.all(12),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    enabled: !context.watch<UserManager>().loading,
                    decoration: InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email)) return 'E-mail Inválido';
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: passController,
                  enabled: !context.watch<UserManager>().loading,
                  decoration: InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6)
                      return 'Senha Inválida';
                    return null;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: primaryColor),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Esqueci a Senha'),
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    padding: EdgeInsets.zero,
                    color: primaryColor,
                    disabledColor: primaryColor.withAlpha(100),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: context.watch<UserManager>().loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              'Entrar',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                    onPressed: context.watch<UserManager>().loading
                        ? null
                        : () {
                            if (formkey.currentState.validate()) {
                              context.read<UserManager>().signIn(
                                  user: User(
                                    email: emailController.text,
                                    password: passController.text,
                                  ),
                                  onSuccess: () {
                                    print('SUCESSO');
                                  },
                                  onFail: (e) {
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(' Falha ao Entrar: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                    //TODO FECHAR TELA DE LOGIN
                                  });
                            }
                          },
                  ),
                ),
                /*FlatButton(
                  padding: EdgeInsets.zero,
                  //padding: EdgeInsets.zero,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Esqueci a Senha'),
                  ),
                  onPressed: () {},
                ),*/
                /*Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      formkey.currentState.validate();
                    },
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
