import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/auth/authenticate.dart';
import 'package:knowledge_checker/screens/view/section_page.dart';
import 'package:knowledge_checker/screens/view/student_page.dart';
// import 'package:knowledge_checker/screens/view/teacher_page.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:provider/provider.dart';

import 'home/home.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    /// return home or auth widget
    return user == null ? Authenticate() : StudentPage();
  }
}
