import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:knowledge_checker/shared/globals.dart';

class AddSkill extends StatefulWidget {
  final String classe;
  final Section section;
  AddSkill({Key key, @required this.classe, @required this.section});
  @override
  _AddSkillState createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkill> {
  final _formKey = GlobalKey<FormState>();
  String skillTitle = "";
  String skillDescription = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Skill"),
        centerTitle: true,
        backgroundColor: darkblue,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    color: backgroundColor,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        skillTitle = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Skill's title",
                      contentPadding:
                          const EdgeInsets.only(left: 8.0, right: 8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 18.0),
                child: Material(
                  // color: Colors.amber,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // width: 150, // TODO : a revoir
                      height: 350,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            skillDescription = value;
                          });
                        },
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Skill's description",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () async {
                        await DatabaseService().insertNewSkill(widget.classe,
                            widget.section.titre, skillTitle, skillDescription);
                        Navigator.pop(context);
                      },
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
                          constraints:
                              BoxConstraints(maxWidth: 125.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Add",
                                    style: TextStyle(fontSize: 20)),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.add_rounded,
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
        ),
      ),
    );
  }
}
