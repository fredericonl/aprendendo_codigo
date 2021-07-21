import 'package:entendo_codigo/common/custom_drower/custom_drawer.dart';
import 'package:entendo_codigo/models/page_manager.dart';
import 'package:entendo_codigo/screens/login_screen.dart';
import 'package:entendo_codigo/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      //Cria o pageControle e envia para PageManager
      create: (_) => PageManager(pageController),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          //SignupScreen(),
          LoginScreen(),
          //!págnia 0
          /*Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Home'),
            ),
          ),*/
          //!págnia1
          Scaffold(
              drawer: CustomDrawer(),
              appBar: AppBar(
                title: Text('Página 1'),
              ),
              body: Container(
                color: Colors.yellow,
              )),

          //!página 2
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Página 2'),
            ),
            body: Container(
              color: Colors.green,
            ),
          ),
          //!página3
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: Text('Página 3'),
            ),
            body: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
