import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/user.dart';
import 'package:knowledge_checker/screens/view/student_page.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ClassSettings extends StatelessWidget {
  List<List<String>> userList = [
    ["Nicolas", "M1 INFO", "assets/images/user.png"],
    ["Yoan", "M1 INFO", "assets/images/user.png"],
    ["Martin", "M1 INFO", "assets/images/user.png"],
    ["Virgile", "M1 INFO", "assets/images/user.png"],
    ["Rémi", "M1 INFO", "assets/images/user.png"],
    ["Benjamain", "M1 INFO", "assets/images/user.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: darkblue,
            collapsedHeight: 100,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            elevation: 15.0,
            flexibleSpace: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: FlexibleSpaceBar(
                    title: Text("Sections settings"),
                    centerTitle: true,
                    background: Image.asset(
                      "assets/images/skill_background_5.jpg",
                      fit: BoxFit.cover,
                    ),
                    collapseMode: CollapseMode.parallax,
                  ),
                ),
                Positioned(
                  top: 30.0,
                  right: 10.0,
                  child: IconButton(
                    icon: Icon(Icons.add_outlined),
                    color: Colors.white,
                    onPressed: () =>
                        null, // TODO : ajouter une page pour ajouter un utilisateur existant à une classe
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 5.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () => StudentPage(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 10.0),
                        child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(userList[index][0]),
                                Container(
                                  width: 50.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.5),
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                Text(userList[index][1]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(userList[index][2]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              childCount: userList.length,
            ),
          ),
        ],
      ),
    );
  }
}
