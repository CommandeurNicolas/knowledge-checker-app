import 'package:flutter/material.dart';
import 'package:knowledge_checker/screens/wrapper.dart';
import 'screens/Auth/login.dart';
import 'screens/Auth/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Wrapper(),
    );
  }
}


