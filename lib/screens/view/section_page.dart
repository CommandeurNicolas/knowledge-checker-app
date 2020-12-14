import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/sectionpage_header.dart';
import 'package:knowledge_checker/shared/view_model/skill_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// TODO : revoir la mise en page du header + mettre bouton retour

class SectionPage extends StatelessWidget {
  final Section section;

  SectionPage({Key key, this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    return Container(
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
                    "Theme progression",
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
                onTap: () => tapped(context, index),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
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
                              "#${section.getSkills()[index].getId()}",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child:
                                  Text(section.getSkills()[index].getTitre())),
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
              childCount: section.getSkills().length,
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
        builder: (context) => SkillPage(
          skill: section.getSkills()[i],
          section: section,
          validation: false,
        ),
      ),
    );
  }
}
