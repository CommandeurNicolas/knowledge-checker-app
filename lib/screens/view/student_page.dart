import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/section_page.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      //body: _scrollView(context,sections),
      body: StreamBuilder(
        stream: DatabaseService().userCollection.document(user.uid).snapshots(),
        builder: (context, snapshot) {
          return StreamBuilder(
              stream: DatabaseService()
                  .userCollection
                  .document(user.uid)
                  .collection("sections")
                  .snapshots(),
              builder: (context, snapshot2) {
                if (snapshot.hasError && snapshot2.hasError) {
                  return Center(
                    child: Text(
                        "\nCaught an error in the firebase thingie... :| "),
                  );
                }
                if (!snapshot.hasData && !snapshot2.hasData) {
                  return Center(
                    child: Text("\nHang On, We are building your app !"),
                  );
                } else {
                  var data = snapshot.data;
                  Map userData = {
                    "username": data.data['username'],
                    "class": data.data['class'],
                  };
                  // DatabaseService()
                  //   .insertNewSection(userData['class'], "c#", "Apprendre","Instancier une variable","Declarer une variable x");
                  //DatabaseService().insertNewSkill(userData['class'], "c#","Loop", "Do a loop");
                  // DatabaseService().getSectionsClasses(data.data['class']);
                  List<Section> listSection = [];

                  var docsSection = snapshot2.data.documents;
                  for (var doc in docsSection) {
                    listSection.add(new Section(
                        doc.data['title'],
                        doc.data['description'],
                        'assets/images/c++.png',
                        null));
                  }

                  // snapshot2.data.documents.asMap().forEach((index, data) {
                  //   var titleSection = data.data['title'];
                  //   var test = DatabaseService()
                  //       .userCollection
                  //       .document(user.uid)
                  //       .collection("sections")
                  //       .document(titleSection)
                  //       .collection("skills")
                  //       .getDocuments()
                  //       .then((dataDoc) {
                  //     var documents = dataDoc.documents;
                  //     Map<String, Object> listSkill = {};
                  //     List<Skill> arraySkillList = [];
                  //     for (var skilldoc in documents) {
                  //       listSkill['title'] = skilldoc.data['title'];
                  //       listSkill['description'] = skilldoc.data['description'];
                  //       listSkill['selfValidated'] =
                  //           skilldoc.data['selfValidated'];
                  //       listSkill['validated'] = skilldoc.data['validated'];
                  //       arraySkillList.add(new Skill(
                  //           1,
                  //           listSkill['title'],
                  //           listSkill['description'],
                  //           listSkill['selfValidated']));
                  //     }
                  //     Section sectemp = new Section(
                  //         data.data['title'],
                  //         data.data['description'],
                  //         'assets/images/c++.png',
                  //         arraySkillList);

                  //     listSection.add(sectemp);
                  //   });
                  return _scrollView(context, userData, listSection);
                }
              });
        },
      ),
    );
  }

  Widget _scrollView(
      BuildContext context, Map userData, List<Section> sections) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: UserPageHeader(
              username: userData['username'],
              filiere: userData['class'],
              image: "assets/images/user.png",
              minExtent: 115.0,
              maxExtent: 320.0,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () =>
                      tapped(context, index, sections, userData['class']),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              sections[index].getImage(),
                              height: 170,
                              fit: BoxFit.fitHeight,
                            ),
                            Center(child: Text(sections[index].titre)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: sections.length,
            ),
          ),
        ],
      ),
    );
  }

  void tapped(
      BuildContext context, int i, List<Section> sections, String classe) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SectionPage(section: sections[i], classe: classe)));
  }
}
