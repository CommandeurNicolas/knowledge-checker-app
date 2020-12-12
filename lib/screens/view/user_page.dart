import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/language_page.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';

class UserPage extends StatelessWidget {
  final List<Skill> sections = [
    new Skill(0, "Java", "java is an object oriented programming language",
        "assets/images/java.png"),
    new Skill(1, "C", "low level language", "assets/images/java.png"),
    new Skill(2, "C++", "low level language object oriented",
        "assets/images/c++.png"),
    new Skill(
        3, "Lisp", "shit language, don't touch it", "assets/images/poop.png"),
    new Skill(4, "Python", "easy language", "assets/images/python.png"),
    new Skill(5, "C#", "object oriented language", "assets/images/c#.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    return Container(
      color: Color(0xFFf0f0f0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: UserPageHeader(
              nom: "Commandeur",
              prenom: "Nicolas",
              filiere: "M1 INFO",
              image: "assets/images/user.png",
              minExtent: 115.0,
              maxExtent: 320.0,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => tapped(context, index),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              sections[index].image,
                              height: 170,
                              fit: BoxFit.fitHeight,
                            ),
                            Center(child: Text(sections[index].titre)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: sections.length,
            ),
          ),
        ],
      ),
    );
  }

  void tapped(BuildContext context, int i) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LanguagePage(section: sections[i])));
  }
}
