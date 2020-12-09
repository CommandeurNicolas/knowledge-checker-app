import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/wrapper.dart';
import 'package:knowledge_checker/services/auth.dart';
import 'screens/Auth/login.dart';
import 'screens/Auth/signup.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home:Wrapper(),
      ),
    );
  }
}


