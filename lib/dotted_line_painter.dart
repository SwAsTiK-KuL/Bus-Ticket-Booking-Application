import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final double startY;
  final double endY;
  final double lineX;

  DottedLinePainter({
    required this.startY,
    required this.endY,
    required this.lineX,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path dashPath = Path();
    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = startY;

    while (startX < endY) {
      dashPath.addRect(Rect.fromLTWH(lineX - 1, startX, 2, dashWidth));
      startX += dashWidth + dashSpace;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
