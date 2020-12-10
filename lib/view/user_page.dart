import 'package:flutter/material.dart';
import 'package:knowledge_checker/view_model/userpage_header.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            UserPageHeader(),
            Column(
              children: [
                SizedBox(
                  height: 370,
                ),
                GridView.builder(gridDelegate: null, itemBuilder: null)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
