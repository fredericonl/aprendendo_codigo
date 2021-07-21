import 'package:entendo_codigo/helpers/validators.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Conta'),
      ),
      backgroundColor: primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            child: ListView(
              padding: EdgeInsets.all(12),
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name.isEmpty || name.length < 3) return 'Nome Inválido';
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'E-mail'),
                    validator: (email) {
                      if (emailValid(email)) return 'E-mail Inválido';
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Senha'),
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6)
                      return 'Senha Inválida';
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: TextFormField(
                    controller: repeatPasswordController,
                    decoration: InputDecoration(hintText: 'Repita a Senha'),
                    validator: (repeatPassword) {
                      if (repeatPassword.isEmpty ||
                          repeatPassword.length < 3 ||
                          repeatPasswordController != passwordController)
                        return 'Senha Inválida';
                      return null;
                    },
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(12),
                  color: primary,
                  child: Text(
                    'Criar Conta',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    if (formkey.currentState.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
