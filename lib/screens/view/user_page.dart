import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/section_page.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/services/database.dart';
import 'package:knowledge_checker/shared/view_model/userpage_header.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      //body: _scrollView(context,sections),
      body: StreamBuilder(
        stream: DatabaseService().userCollection.document(user.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("\nCaught an error in the firebase thingie... :| "),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("\nHang On, We are building your app !"),
            );
          } else {
            var data = snapshot.data;
            Map userData = {
              "username":data.data['username'],
              "class":data.data['class'],
            };

            List<Section> sections = [];
            //print(data.data);
            //
            //print(data.data['sections']);

            for (var section in data.data['sections']) {
              print(section);
              List<Skill> skills = [];
              for (var skill in section['skills']) {
                print(skill);
                skills.add(new Skill(1, skill['title'], skill['description'],skill['validated']));
              }
              sections.add(new Section(
                  section['title'], 'assets/images/c++.png', skills));
            }
            print("YOLOOOO");
            print(sections[0].getTitre());
            return _scrollView(context, userData, sections);
          }
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
              filiere:userData['class'],
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
                  onTap: () => tapped(context, index, sections),
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

  void tapped(BuildContext context, int i, List<Section> sections) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SectionPage(section: sections[i])));
  }
}
