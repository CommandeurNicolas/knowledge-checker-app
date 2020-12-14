import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/screens/view/add_skill.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SkillSettings extends StatefulWidget {
  final Section section;

  SkillSettings({Key key, this.section});

  @override
  _SkillSettingsState createState() => _SkillSettingsState();
}

class _SkillSettingsState extends State<SkillSettings> {
  bool isSettings = true;

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
                  top: 25.0,
                  right: 10.0,
                  child: ButtonBar(
                    children: [
                      Container(
                        height: 30,
                        width: 191,
                        child: ToggleSwitch(
                          minWidth: 95.0,
                          initialLabelIndex: isSettings == true ? 0 : 1,
                          cornerRadius: 20.0,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          labels: ['settings', 'delete'],
                          icons: [
                            Icons.settings_outlined,
                            Icons.delete_outline_rounded
                          ],
                          activeBgColors: [mygreen, Colors.red],
                          onToggle: (index) {
                            if (index == 0)
                              setState(() {
                                isSettings = true;
                              });
                            else
                              setState(() {
                                isSettings = false;
                              });
                            print(isSettings);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_outlined),
                        onPressed: () => addTapped(context),
                        color: Colors.white,
                      ),
                    ],
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
          SliverFixedExtentList(
            itemExtent: 56.0, // Forcing item height
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () => isSettings == true
                    ? settingsTapped(context, index)
                    : deleteTapped(context, index),
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
                              "#${widget.section.getSkills()[index].getId()}",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            )),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              widget.section.getSkills()[index].getTitre(),
                            ),
                          ),
                          _switchButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              childCount: widget.section.getSkills().length,
            ),
          ),
        ],
      ),
    );
  }

  void settingsTapped(BuildContext context, int i) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkillSettings(
          section: widget.section,
        ),
      ),
    );
  }

  void deleteTapped(BuildContext context, int i) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => StudentPage(),
    //   ),
    // );
  }

  void addTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddSkill(),
      ),
    );
  }

  Widget _switchButton() {
    return isSettings
        ? Container(
            color: mygreen,
            width: 70,
            height: 90,
            child: Center(
              child: Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
            ),
          )
        : Container(
            color: Colors.red,
            width: 70,
            height: 90,
            child: Center(
              child: Icon(
                Icons.delete_outline_rounded,
                color: Colors.white,
              ),
            ),
          );
  }
}
