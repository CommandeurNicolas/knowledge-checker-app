import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/skill_page.dart';

class SkillValidation extends StatefulWidget {
  @override
  _SkillValidationState createState() => _SkillValidationState();
}

class _SkillValidationState extends State<SkillValidation> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

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
    // print(sections[0].getSkills()[0].getTitre());
    return Scaffold(
      backgroundColor: Color(0xFFf0f0f0),
      appBar: AppBar(
        title: Text("Validation de compétences"),
        backgroundColor: myblue,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            // itemExtent: 60.0, // Forcing item height
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: ExpansionTileCard(
                  leading: Image.asset(sections[index].getImage()),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        sections[index].getTitre(),
                      ),
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Container(
                          height: 60.0 * sections[index].getSkills().length,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: sections[index].getSkills().length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => tapped(
                                  context,
                                  sections[index].getSkills()[i],
                                  sections[index],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 20.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      color: Color(0xFFf2f2f2),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            color: mygreen,
                                            width: 50,
                                            height: 50,
                                            child: Center(
                                                child: Text(
                                              "#${sections[index].getSkills()[i].getId()}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            )),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              sections[index]
                                                  .getSkills()[i]
                                                  .getTitre(),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Icon(Icons.arrow_forward_ios,
                                                color: myblue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              childCount: sections.length,
            ),
          ),
        ],
      ),
    );
  }

  void tapped(BuildContext context, Skill skill, Section section) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkillPage(
          skill: skill,
          section: section,
          validation: true,
          proof: "here is the proof that i have the skill !",
        ),
      ),
    );
  }
}
