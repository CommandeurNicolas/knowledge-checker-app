import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/globals.dart';

class SkillPage extends StatelessWidget {
  Skill skill;
  Section section;

  SkillPage({Key key, @required this.skill, @required this.section});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: darkblue,
            collapsedHeight: 105.0,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '#${skill.getId()}',
                      style: TextStyle(fontSize: 34),
                    ),
                    TextSpan(text: '\n\n'),
                    TextSpan(
                      text: skill.getTitre(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                "assets/images/skill_background_6.jpg",
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
              child: Text(
                skill.getDesc(),
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Divider(
                height: 50.0,
                thickness: 2.0,
                color: darkblue,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
              child: Text(
                'Preuve',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Material(
                // color: Colors.amber,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // color: Colors.amber,
                    width: 150,
                    height: 500,
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: RaisedButton(
                  onPressed: null, // TODO : listener
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [darkblue, mygreen],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: double.infinity, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Send to teacher  ",
                                style: TextStyle(fontSize: 20)),
                            WidgetSpan(
                              child: Icon(
                                Icons.send_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
