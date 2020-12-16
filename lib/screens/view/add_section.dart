import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:knowledge_checker/services/database.dart';

class AddSection extends StatefulWidget {
  String classe;
  AddSection({Key key, @required this.classe});
  @override
  _AddSectionState createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  final _formKey = GlobalKey<FormState>();

  String sectionTitle = "";
  String sectionDescription = "";
  String skillTitle = "";
  String skillDescription = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Section"),
        centerTitle: true,
        backgroundColor: darkblue,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    onChanged: (val) {
                      setState(() {
                        sectionTitle = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Section's title",
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
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                            sectionDescription = value;
                          });
                        },
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration:
                            InputDecoration(hintText: "Section's description"),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTileCard(
                  leading: Text(
                    "#1",
                    style: TextStyle(fontSize: 22),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("First Skill (needed)"),
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, bottom: 18.0),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Skill's title"),
                        onChanged: (value) {
                          setState(() {
                            skillTitle = value;
                          });
                        },
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
                              maxLines: null,
                              onChanged: (value) {
                                setState(() {
                                  skillDescription = value;
                                });
                              },
                              expands: true,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "Skill's description"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: RaisedButton(
                      onPressed: () async {
                        await DatabaseService().insertNewSection(
                            widget.classe,
                            sectionTitle,
                            sectionDescription,
                            skillTitle,
                            skillDescription);
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
