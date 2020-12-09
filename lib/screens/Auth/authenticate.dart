import 'package:flutter/material.dart';
import 'package:knowledge_checker/screens/Auth/login.dart';
import 'package:knowledge_checker/screens/Auth/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toogleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn ? LogIn(toogleView:toogleView) : SignIn(toogleView:toogleView);
  }
}
