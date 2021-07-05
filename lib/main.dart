import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/wrapper.dart';
import 'package:knowledge_checker/services/auth.dart';
import 'package:flutter/services.dart';
import 'screens/auth/log_in.dart';
import 'screens/auth/sign_up.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
