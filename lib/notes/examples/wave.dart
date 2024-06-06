import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        body: Center(
          child: Container(
            width: 400,
            height: 600,
            child: CustomPaint(
              painter: WavePainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.3)
      ..lineTo(size.width, 0)
      ..close();

    paint.color = Colors.deepOrange;
    canvas.drawPath(path1, paint);

    final path2 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width, size.height * 0.4)
      ..lineTo(size.width, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.6, 0, size.height * 0.7)
      ..close();

    paint.color = Colors.orangeAccent;
    canvas.drawPath(path2, paint);

    final path3 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.5, size.height, 0, size.height * 0.9)
      ..close();

    paint.color = Colors.lightBlueAccent;
    canvas.drawPath(path3, paint);

    final path4 = Path()
      ..moveTo(0, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.5, size.height * 1.0, size.width, size.height * 0.9)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    paint.color = Colors.blue;
    canvas.drawPath(path4, paint);

    final path5 = Path()
      ..moveTo(0, size.height * 1.0)
      ..lineTo(size.width, size.height * 1.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    paint.color = Colors.indigo;
    canvas.drawPath(path5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
