import 'dart:math';
import 'package:flutter/material.dart';

class RouletteWheelPainter extends CustomPainter {
  final List<int> numbers = [
    0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5,
    24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26
  ];

  final List<Color> colors = [
    Colors.green, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black, Colors.red, Colors.black, Colors.red, Colors.black, Colors.red,
    Colors.black
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    for (int i = 0; i < numbers.length; i++) {
      paint.color = colors[i];

      final sweepAngle = 2 * pi / numbers.length;
      final startAngle = i * sweepAngle;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: numbers[i].toString(), style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final angle = startAngle + sweepAngle / 2;
      final textOffset = Offset(
        center.dx + (radius - 30) * cos(angle) - textPainter.width / 2,
        center.dy + (radius - 30) * sin(angle) - textPainter.height / 2,
      );

      textPainter.paint(canvas, textOffset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
