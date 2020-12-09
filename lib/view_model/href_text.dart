import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HrefText extends StatelessWidget {
  final String text;
  final StatelessWidget widget;

  HrefText({Key key, this.text, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RichText(
      text: new TextSpan(
        children: [
          new TextSpan(
            text: text,
            style: new TextStyle(color: Colors.blue, fontSize: 15),
            recognizer: new TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
          ),
        ],
      ),
    );
  }
}
