import 'package:entendo_codigo/helpers/firebase_errors.dart';
import 'package:entendo_codigo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadingCurrentUser();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  FirebaseUser user;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    try {
      loading = true;
      //setLoading(true);
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      this.user = result.user;

      onSuccess();
      print(result.user.uid);
      loading = false;
      //setLoading(false);
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> createCount(
      {User user, Function onFail, Function onSuccess}) async {
    //auth.createUserWithEmailAndPassword(email: email, password: password)
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadingCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
      print(user.uid);
    }
    notifyListeners();
  }

  /*void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }*/
}
