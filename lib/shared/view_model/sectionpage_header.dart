import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:knowledge_checker/shared/globals.dart';

class SectionPageHeader extends SliverPersistentHeaderDelegate {
  final String image;
  final String titre;
  final double minExtent;
  final double maxExtent;

  SectionPageHeader(
      {Key key,
      this.image,
      this.titre,
      this.minExtent,
      @required this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 0, top: 0, right: 0),
        height: maxExtent,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 0), // TODO : revoir la taille de la box
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    left: 75,
                    child: Image.asset(
                      image,
                      height: 200,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 55,
                    left: 300,
                    child: LanguageBadge(),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: VerticalText(titre: titre),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class VerticalText extends StatelessWidget {
  final String titre;
  VerticalText({Key key, this.titre});

  @override
  Widget build(BuildContext context) {
    // TODO : peut etre mettre le texte a l'horizontal
    return Material(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10.0),
        bottomRight: Radius.circular(10.0),
      ),
      color: mygreen,
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
        height: 210,
        width: 30,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: titre.length,
          itemBuilder: (context, index) {
            return Text(
              titre[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            );
          },
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Material(
  //     borderRadius: BorderRadius.only(
  //       bottomLeft: Radius.circular(10.0),
  //       bottomRight: Radius.circular(10.0),
  //     ),
  //     color: mygreen,
  //     child: Container(
  //       // color: Colors.amber,
  //       // padding: EdgeInsets.only(top: 35.0),
  //       width: 30,
  //       height: 210,
  //       child: RotatedBox(
  //         quarterTurns: 3,
  //         child: Center(
  //           child: Text(
  //             "INFO 701",
  //             style: TextStyle(color: Colors.white, fontSize: 20),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

}

class LanguageBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/gold.png",
          height: 60,
          width: 60,
        ),
        SizedBox(height: 5),
        Image.asset(
          "assets/images/silver.png",
          height: 60,
          width: 60,
        ),
        SizedBox(height: 5),
        Image.asset(
          "assets/images/bronze.png",
          height: 60,
          width: 60,
        ),
      ],
    );
  }
}
