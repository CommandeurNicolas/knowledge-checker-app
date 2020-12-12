import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/globals.dart';

class SkillPage extends StatelessWidget {
  Skill skill;

  SkillPage({Key key, this.skill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: darkblue,
            collapsedHeight: 135.0,
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
                      text: 'Créer une variable de type String',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              background: Image.asset(
                "assets/images/skill_background.jpg",
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
                color: darkblue,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18.0),
              child: Text(
                "Preuve",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
