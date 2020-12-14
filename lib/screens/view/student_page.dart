import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/section_page.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';

class StudentPage extends StatelessWidget {
  final List<Section> sections = [
    new Section("Java", "assets/images/java.png", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false)
    ]),
    new Section("C", "assets/images/java.png", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false)
    ]),
    new Section("C++", "assets/images/c++.png", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false),
    ]),
    new Section("Lisp", "assets/images/poop.png", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false)
    ]),
    new Section("Python", "assets/images/python.png", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false)
    ]),
    new Section("C#", "assets/images/c#.jpg", [
      new Skill(1, "titre skill 1", "desc skill 1", false, false),
      new Skill(2, "titre skill 2", "desc skill 2", false, false),
      new Skill(3, "titre skill 3", "desc skill 3", false, false)
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0),
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    return Container(
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
                              sections[index].getImage(),
                              height: 170, // TODO : a revoir
                              fit: BoxFit.fitHeight,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                sections[index].titre,
                                textAlign: TextAlign.center,
                              ),
                            ),
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
            builder: (context) => SectionPage(section: sections[i])));
  }
}
