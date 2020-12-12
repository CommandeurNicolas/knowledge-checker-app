import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/screens/auth/form_sign_up.dart';
import 'package:knowledge_checker/services/auth.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:provider/provider.dart';
import 'package:knowledge_checker/shared/view_model/decoration_shapes.dart';
import 'package:knowledge_checker/shared/globals.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().classes,
      child: FormSignUp(),
    );
  }
}
