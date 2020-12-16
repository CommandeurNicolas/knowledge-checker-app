import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/view/student_page.dart';
import 'package:knowledge_checker/screens/view/teacher_page.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream:
          DatabaseService().teacherCollection.document(user.uid).snapshots(),
      builder: (context, snapshot) {
        // return snapshot.
        var data = snapshot.data;
        if (data.data == null) {
          return StudentPage();
        }
        return TeacherPage();
      },
    );
  }
}
