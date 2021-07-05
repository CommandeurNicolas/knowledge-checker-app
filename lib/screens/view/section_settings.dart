import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/section.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/screens/view/add_section.dart';
import 'package:knowledge_checker/screens/view/skill_settings.dart';
import 'package:knowledge_checker/screens/view/student_page.dart';
import 'package:knowledge_checker/shared/globals.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SectionSettings extends StatefulWidget {
  List<Section> sections;
  String classe;
  SectionSettings({Key key, this.sections, @required this.classe});
  @override
  _SectionSettingsState createState() => _SectionSettingsState();
}

class _SectionSettingsState extends State<SectionSettings> {
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
          SliverList(
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
                      height: 90,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            // color: mygreen,
                            width: 90,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                widget.sections[index].getImage(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.sections[index]
                                      .getTitre()
                                      .toUpperCase(),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 3.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.5),
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                Text(
                                  "Contient ${widget.sections[index].getSkills().length.toString()} skill${needS(widget.sections[index].getSkills().length)}",
                                ),
                              ],
                            ),
                          ),
                          _switchButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              childCount: widget.sections.length,
            ),
          ),
        ],
      ),
    );
  }

  String needS(int i) {
    if (i == 1)
      return "";
    else
      return "s";
  }

  void settingsTapped(BuildContext context, int i) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SkillSettings(
          section: widget.sections[i],
          classe: widget.classe,
        ),
      ),
    );
  }

  void deleteTapped(BuildContext context, int i) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => (),
    //   ),
    // );
  }

  void addTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddSection(classe: widget.classe),
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
