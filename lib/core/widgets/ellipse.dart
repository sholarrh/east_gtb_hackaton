

import 'package:flutter/material.dart';

class EllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Replace the values below with your desired ellipse dimensions
    const rect = Rect.fromLTWH(50, 50, 200, 100);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class EllipseDemo extends StatelessWidget {
  const EllipseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: CustomPaint(
            painter: EllipsePainter(),
            child: Icon(
              Icons.question_mark,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

