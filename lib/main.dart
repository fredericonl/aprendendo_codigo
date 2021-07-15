import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entendo_codigo/screens/base/base_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());

  Firestore.instance
      .collection('boletos')
      .document('luz')
      .snapshots()
      .listen((document) {
    print(document.data);
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reutilização de Entulho',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
