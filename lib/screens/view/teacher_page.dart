import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/class_settings.dart';
import 'package:knowledge_checker/screens/view/section_settings.dart';
import 'package:knowledge_checker/screens/view/skill_validation.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';

class TeacherPage extends StatelessWidget {
  List<List> profTiles = [
    [
      "assets/images/skill_validation.png",
      "Compétences en attente de validation",
      12
    ],
    ["assets/images/section.png", "Gérer les sections"],
    ["assets/images/class.png", "Classe", 27]
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
        physics: NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: UserPageHeader(
              nom: "LeProf",
              prenom: "Nicolas",
              filiere: "M1 INFO",
              image: "assets/images/user.png",
              minExtent: 115.0,
              maxExtent: 320.0,
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => tapped(context, SkillValidation()),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Badge(
                  badgeContent: Text(
                    profTiles[0][2].toString(),
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
                                profTiles[0][1],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.arrow_forward_ios, color: myblue),
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
              onTap: () => tapped(context, SectionSettings()),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
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
                              profTiles[1][1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_forward_ios, color: myblue),
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
              onTap: () => tapped(context, ClassSettings()),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                profTiles[2][2].toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
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
                              profTiles[2][1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_forward_ios, color: myblue),
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

  void tapped(BuildContext context, Widget widget) {
    print("widget tapped");
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
