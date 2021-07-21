import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entendo_codigo/models/user.dart';
import 'package:entendo_codigo/models/user_manager.dart';
import 'package:entendo_codigo/screens/base/base_screen.dart';
import 'package:entendo_codigo/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());

  /*Firestore.instance
      .collection('boletos')
      .document('luz')
      .snapshots()
      .listen((document) {
    // print(document.data);
  })*/
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reutilização de Entulho',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: Color.fromARGB(255, 4, 125, 141),
          appBarTheme: AppBarTheme(
            elevation: 0,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
        routes: {
          '/criarConta': (_) => SignupScreen(),
        },
      ),
    );
  }
}
