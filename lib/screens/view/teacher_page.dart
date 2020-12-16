import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/view/class_settings.dart';
import 'package:knowledge_checker/screens/view/section_settings.dart';
import 'package:knowledge_checker/screens/view/skill_validation.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';
import 'package:provider/provider.dart';

class TeacherPage extends StatefulWidget {
  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: _scrollView(context, user),
    );
  }

  Widget _scrollView(BuildContext context, User user) {
    return StreamBuilder(
      stream:
          DatabaseService().teacherCollection.document(user.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("\nCaught an error in the firebase thingie... :| "),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("\nHang On, We are building your app !"),
          );
        } else {
          var data = snapshot.data;

          return StreamBuilder(
            stream: DatabaseService()
                .classCollection
                .document(data.data['class'])
                .snapshots(),
            builder: (context, snapshot2) {
              if (snapshot2.hasError) {
                return Center(
                  child:
                      Text("\nCaught an error in the firebase thingie... :| "),
                );
              }
              if (!snapshot2.hasData) {
                return Center(
                  child: Text("\nHang On, We are building your app !"),
                );
              } else {
                var dataClasse = snapshot2.data;
                List<dynamic> waiting = dataClasse.data['waiting'];
                List<Section> sectionList = [];
                Set<String> sectionSet = {};

                Map<String, List<Skill>> sectionSkillMap = {};
                for (var request in waiting) {
                  sectionSet.add(request['sectionTitle']);
                }
                for (var request in waiting) {
                  sectionSkillMap[request['sectionTitle']] = [];
                }
                for (var request in waiting) {
                  sectionSkillMap[request['sectionTitle']].add(new Skill(
                      request['skillTitle'], "", false, false, request['uid']));
                }
                List<Section> sectionListSend = [];
                for (var sectionKey in sectionSkillMap.keys) {
                  sectionListSend.add(new Section(sectionKey, null,
                      "assets/images/java.png", sectionSkillMap[sectionKey]));
                }
                List<List> profTiles = [
                  ["Compétences en attente de validation", waiting.length],
                  ["Gérer les sections"],
                  ["Classe", dataClasse.data['number']]
                ];

                return Container(
                  child: CustomScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    slivers: <Widget>[
                      SliverPersistentHeader(
                        pinned: true,
                        floating: false,
                        delegate: UserPageHeader(
                          username: data.data['username'],
                          filiere: data.data['class'],
                          image: "assets/images/user.png",
                          minExtent: 115.0,
                          maxExtent: 320.0,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () async {
                            tapped(
                                context,
                                SkillValidation(
                                    validationList: sectionListSend,
                                    classe: data.data['class']));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: Badge(
                              badgeContent: Text(
                                profTiles[0][1].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 130,
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        color: mygreen,
                                        width: 70,
                                        height: 130,
                                        child: Center(
                                          child: Icon(
                                            Icons.assignment_turned_in_outlined,
                                            color: Colors.white,
                                            size: 25.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Text(
                                            profTiles[0][0],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: myblue),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () async {
                            var temp = await DatabaseService()
                                .getSectionsClasses(data.data['class']);
                            print(temp);
                            List<Section> sectionRes = [];
                            for (var sectionKey in temp.keys) {
                              print(sectionKey);
                              List<Skill> skills = [];
                              for (var skill in temp[sectionKey]["skills"]) {
                                skills.add(new Skill(skill['title'],
                                    skill['description'], false, false, ""));
                              }
                              sectionRes.add(new Section(sectionKey, " ",
                                  "assets/images/c++.png", skills));
                            }

                            tapped(
                                context,
                                SectionSettings(
                                  sections: sectionRes,
                                  classe: data.data['class'],
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 130,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: mygreen,
                                      width: 70,
                                      height: 130,
                                      child: Center(
                                        child: Icon(
                                          Icons.assessment_outlined,
                                          color: Colors.white,
                                          size: 25.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          profTiles[1][0],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.arrow_forward_ios,
                                          color: myblue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: GestureDetector(
                          onTap: () async {
                            List<List<String>> listUser =
                                await DatabaseService()
                                    .getMemberClass(data.data['class']);
                            ;
                            tapped(
                                context,
                                ClassSettings(
                                  userList: listUser,
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 130,
                                color: Colors.white,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      color: mygreen,
                                      width: 70,
                                      height: 130,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            profTiles[2][1].toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0),
                                          ),
                                          Icon(
                                            Icons.supervisor_account_outlined,
                                            color: Colors.white,
                                            size: 25.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          profTiles[2][0],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.arrow_forward_ios,
                                          color: myblue),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  void tapped(BuildContext context, Widget widget) {
    print("widget tapped");
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
