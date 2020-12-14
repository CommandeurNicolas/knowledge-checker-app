import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_checker/shared/globals.dart';

class DecorationShapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: ShapesPainter(),
      child: Container(
        height: 810,
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  double pi = 3.1415;
  List positionBlueCircle = [152.0 * 2, 650.0 * 2];
  List positionGreenCircle = [290.0 * 2, 213.0 * 2];
  List positionBluePlus = [35.0 * 2, 536.0 * 2];
  List positionGreenCross = [69.0 * 2, 225.0 * 2];
  List positionGreenFlower = [239.0 * 2, 143.0 * 2];

  @override
  void paint(Canvas canvas, Size size) {
    Paint blueCircle = new Paint()
      ..color = myblue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    Paint greenCircle = new Paint()
      ..color = mygreen
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Paint bluePlus = new Paint()
      ..color = myblue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Paint greenCross = new Paint()
      ..color = mygreen
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    Paint greenFlower = new Paint()
      ..color = mygreen
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    // Drawing a blue circle
    Offset center =
        new Offset(positionBlueCircle[0] / 2, positionBlueCircle[1] / 2);
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: 7.0),
      -pi / 2,
      2 * pi,
      false,
      blueCircle,
    );

    // Drawing a green circle
    center = new Offset(positionGreenCircle[0] / 2, positionGreenCircle[1] / 2);
    canvas.drawArc(
      new Rect.fromCircle(center: center, radius: 4.0),
      -pi / 2,
      2 * pi,
      false,
      greenCircle,
    );

    // Drawing a blue plus
    center = new Offset(positionBluePlus[0] / 2, positionBluePlus[1] / 2);
    canvas.drawLine(center.translate(0, 5), center.translate(0, 10), bluePlus);
    canvas.drawLine(
        center.translate(0, -5), center.translate(0, -10), bluePlus);
    canvas.drawLine(center.translate(5, 0), center.translate(10, 0), bluePlus);
    canvas.drawLine(
        center.translate(-5, 0), center.translate(-10, 0), bluePlus);

    // Drawing a green cross
    center = new Offset(positionGreenCross[0] / 2, positionGreenCross[1] / 2);
    canvas.drawLine(
        center.translate(-5, -5), center.translate(5, 5), greenCross);
    canvas.drawLine(
        center.translate(5, -5), center.translate(-5, 5), greenCross);

    // Drawing a green flower
    center = new Offset(positionGreenFlower[0] / 2, positionGreenFlower[1] / 2);
    canvas.drawLine(
        center.translate(0, 6), center.translate(0, 12), greenFlower);
    canvas.drawLine(
        center.translate(0, -6), center.translate(0, -12), greenFlower);
    canvas.drawLine(
        center.translate(6, 0), center.translate(12, 0), greenFlower);
    canvas.drawLine(
        center.translate(-6, 0), center.translate(-12, 0), greenFlower);
    canvas.drawLine(
        center.translate(4.5, 4.5), center.translate(8.5, 8.5), greenFlower);
    canvas.drawLine(center.translate(-4.5, -4.5), center.translate(-8.5, -8.5),
        greenFlower);
    canvas.drawLine(
        center.translate(-4.5, 4.5), center.translate(-8.5, 8.5), greenFlower);
    canvas.drawLine(
        center.translate(4.5, -4.5), center.translate(8.5, -8.5), greenFlower);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
