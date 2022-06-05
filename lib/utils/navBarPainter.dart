import 'package:flutter/material.dart';

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5144933, size.height * 1.008602);
    path_0.lineTo(size.width * 0.4449520, size.height * 1.009709);
    path_0.cubicTo(
        size.width * 0.4449520,
        size.height * 1.009709,
        size.width * 0.4449520,
        size.height * 1.008641,
        size.width * 0.4449520,
        size.height * 1.006602);
    path_0.lineTo(size.width * 0.0003179600, size.height * 0.9938544);
    path_0.lineTo(0, size.height * 0.2187553);
    path_0.lineTo(size.width * 0.3252880, size.height * 0.2187553);
    path_0.cubicTo(
        size.width * 0.3252880,
        size.height * 0.2187553,
        size.width * 0.3840933,
        size.height * 0.2274767,
        size.width * 0.4308720,
        size.height * 0.08344981);
    path_0.cubicTo(
        size.width * 0.4560347,
        size.height * 0.01681029,
        size.width * 0.4796987,
        size.height * -0.002016029,
        size.width * 0.4991147,
        size.height * 0.0001664650);
    path_0.cubicTo(
        size.width * 0.5185307,
        size.height * -0.002016029,
        size.width * 0.5421947,
        size.height * 0.01681029,
        size.width * 0.5673440,
        size.height * 0.08344981);
    path_0.cubicTo(
        size.width * 0.6141360,
        size.height * 0.2274854,
        size.width * 0.6729280,
        size.height * 0.2187553,
        size.width * 0.6729280,
        size.height * 0.2187553);
    path_0.lineTo(size.width * 0.9982293, size.height * 0.2187553);
    path_0.lineTo(size.width, size.height * 1.000835);
    path_0.lineTo(size.width * 0.5532827, size.height * 1.007971);
    path_0.cubicTo(
        size.width * 0.5532827,
        size.height * 1.009126,
        size.width * 0.5532827,
        size.height * 1.009709,
        size.width * 0.5532827,
        size.height * 1.009709);
    path_0.lineTo(size.width * 0.5144933, size.height * 1.008602);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.grey[50]!;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
