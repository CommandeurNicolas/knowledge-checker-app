import 'package:flutter/material.dart';
import 'package:knowledge_checker/screens/auth/log_in.dart';
import 'package:knowledge_checker/screens/auth/sign_up.dart';

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
    return showSignIn ? LogIn(toogleView:toogleView) : SignUp(toogleView:toogleView);
  }
}
