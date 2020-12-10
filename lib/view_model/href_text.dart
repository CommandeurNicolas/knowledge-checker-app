import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HrefText extends StatefulWidget {
  final String text;
  final StatefulWidget widget;

  HrefText({Key key, this.text, this.widget}) : super(key: key);

  @override
  _HrefTextState createState() => _HrefTextState();
}

class _HrefTextState extends State<HrefText> {
  @override
  Widget build(BuildContext context) {
    return new RichText(
      text: new TextSpan(
        children: [
          new TextSpan(
            text: widget.text,
            style: new TextStyle(color: Colors.blue, fontSize: 15),
            recognizer: new TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.widget),
                );
              },
          ),
        ],
      ),
    );
  }
}
