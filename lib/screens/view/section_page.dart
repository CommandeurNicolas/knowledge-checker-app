import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/sectionpage_header.dart';
import 'package:knowledge_checker/shared/view_model/skill_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

// TODO : revoir la mise en page du header + mettre bouton retour

class SectionPage extends StatelessWidget {
  final Section section;
  final String classe;
  SectionPage({Key key, this.section, this.classe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder(
        stream: DatabaseService()
            .userCollection
            .document(user.uid)
            .collection("sections")
            .document(section.titre)
            .collection("skills")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("\nCaught an error in the firebase thingie... :| "),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("\nHang On, We are building your app !"),
            );
          } else {
            List<Skill> skillList = [];
            var dataSkills = snapshot.data;
            for (var skillDoc in dataSkills.documents) {
              skillList.add(new Skill(
                  skillDoc['title'],
                  skillDoc['description'],
                  skillDoc['selfValidated'],
                  skillDoc['validated'],
                  null,
                  skillDoc['proof']));
            }

            return Container(
              color: Color(0xFFf0f0f0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: false,
                    floating: false,
                    delegate: SectionPageHeader(
                      titre: section.getTitre(),
                      image: section.getImage(),
                      minExtent: 115.0,
                      maxExtent: 320.0,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Progression",
                            style: TextStyle(fontSize: 24.0),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearPercentIndicator(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            lineHeight: 14.0,
                            percent: 0.5,
                            backgroundColor: Colors.grey[400],
                            progressColor: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Divider(
                      height: 50.0,
                      thickness: 2.0,
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 56.0, // Forcing item height
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        onTap: () =>
                            tapped(context, index, skillList, user.uid, classe),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 70,
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    color: mygreen,
                                    width: 70,
                                    height: 70,
                                    child: Center(
                                        child: Text(
                                      "#${index + 1}",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                      child: Text(skillList[index].getTitre())),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.arrow_forward_ios,
                                        color: darkblue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      childCount: skillList.length,
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }

  void tapped(BuildContext context, int i, List<Skill> skillList, String uid,
      String classe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkillPage(
            index: i + 1,
            skill: skillList[i],
            section: section,
            validation: false,
            uid: uid,
            classe: classe),
      ),
    );
  }
}
