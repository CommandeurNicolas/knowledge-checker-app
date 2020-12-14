import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/globals.dart';

class SkillPage extends StatelessWidget {
  Skill skill;
  Section section;
  bool validation;
  String proof;

  SkillPage({
    Key key,
    @required this.skill,
    @required this.section,
    @required this.validation,
    this.proof,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: myblue,
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
                "assets/images/skill_background_1.jpg",
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
                color: myblue,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
              child: Text(
                'Proof',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
              child: Material(
                // color: Colors.amber,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: () {
                    if (validation) {
                      print("text");
                      return Container(
                        // width: 150,
                        child: Text(proof),
                      );
                    } else {
                      return Container(
                        // width: 150, // TODO : a revoir
                        height: 500,
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                        ),
                      );
                    }
                  }(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: () {
              if (validation) {
                return Container(
                  width: double.infinity,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        onPressed: null, // TODO : listener
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFb30000), Color(0xFF242323)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: double.infinity, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Insufficient proof ",
                                        style: TextStyle(fontSize: 18)),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons
                                            .clear_rounded, // TODO : trouver un icon croix
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
                      RaisedButton(
                        onPressed: null, // TODO : listener
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [myblue, mygreen],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: double.infinity, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "Sufficient proof  ",
                                        style: TextStyle(fontSize: 18)),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.check_rounded,
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
                    ],
                  ),
                );
              } else {
                return Align(
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
                            colors: [myblue, mygreen],
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
                );
              }
            }(),
          ),
        ],
      ),
    );
  }
}
