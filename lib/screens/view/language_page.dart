import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:knowledge_checker/models/skill.dart';
import 'package:knowledge_checker/shared/view_model/languagepage_header.dart';

class LanguagePage extends StatelessWidget {
  final Skill section;

  LanguagePage({Key key, this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    return Container(
      color: Color(0xFFf0f0f0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: LanguagePageHeader(
              titre: skill.titre,
              image: skill.image,
              minExtent: 115.0,
              maxExtent: 320.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Theme progression",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TODO : implement percent_indicator 2.1.8
                  Stack(
                    children: [
                      Container(color: Colors.amber, height: 10.0),
                      Container(
                        color: Colors.brown,
                        height: 10.0,
                        width: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              height: 50.0,
              thickness: 2.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    height: 20,
                    width: 20,
                  ),
                );
              },
              childCount: 200,
            ),
          ),
        ],
      ),
    );
  }
}
