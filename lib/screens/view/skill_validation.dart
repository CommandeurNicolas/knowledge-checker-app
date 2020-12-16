import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/shared/view_model/skill_page.dart';
import 'package:provider/provider.dart';

class SkillValidation extends StatefulWidget {
  List<Section> validationList;
  String classe;
  SkillValidation({Key key, this.validationList, this.classe});
  @override
  _SkillValidationState createState() => _SkillValidationState();
}

class _SkillValidationState extends State<SkillValidation> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Validation de compétences"),
        backgroundColor: darkblue,
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
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        widget.validationList[index].getTitre(),
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
                          height: 60.0 *
                              widget.validationList[index].getSkills().length,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                widget.validationList[index].getSkills().length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => tapped(
                                    context,
                                    widget.validationList[index].getSkills()[i],
                                    widget.validationList[index],
                                    widget.classe,
                                    index),
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
                                              "#${i + 1}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            )),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              widget.validationList[index]
                                                  .getSkills()[i]
                                                  .getTitre(),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Icon(
                                                Icons.arrow_forward_ios_rounded,
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
              childCount: widget.validationList.length,
            ),
          ),
        ],
      ),
    );
  }

  void tapped(BuildContext context, Skill skill, Section section, String classe,
      int i) {
    final user = Provider.of<User>(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkillPage(
          index: i,
          skill: skill,
          section: section,
          validation: true,
          proof: "here is the proof that i have the skill !",
          uid: skill.idOwner,
          classe: classe,
        ),
      ),
    );
  }
}
