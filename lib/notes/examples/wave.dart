import 'package:flutter/material.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.pink[100],
//         body: Center(
//           child: Container(
//             width: 400,
//             height: 600,
//             child: CustomPaint(
//               painter: WavePainter(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class WavePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..style = PaintingStyle.fill;
//
//     final path1 = Path()
//       ..lineTo(0, size.height * 0.3)
//       ..quadraticBezierTo(size.width * 0.5, size.height * 0.4, size.width, size.height * 0.3)
//       ..lineTo(size.width, 0)
//       ..close();
//
//     paint.color = Colors.deepOrange;
//     canvas.drawPath(path1, paint);
//
//     final path2 = Path()
//       ..moveTo(0, size.height * 0.3)
//       ..quadraticBezierTo(size.width * 0.5, size.height * 0.5, size.width, size.height * 0.4)
//       ..lineTo(size.width, size.height * 0.7)
//       ..quadraticBezierTo(size.width * 0.5, size.height * 0.6, 0, size.height * 0.7)
//       ..close();
//
//     paint.color = Colors.orangeAccent;
//     canvas.drawPath(path2, paint);
//
//     final path3 = Path()
//       ..moveTo(0, size.height * 0.7)
//       ..quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width, size.height * 0.7)
//       ..lineTo(size.width, size.height * 0.9)
//       ..quadraticBezierTo(size.width * 0.5, size.height, 0, size.height * 0.9)
//       ..close();
//
//     paint.color = Colors.lightBlueAccent;
//     canvas.drawPath(path3, paint);
//
//     final path4 = Path()
//       ..moveTo(0, size.height * 0.9)
//       ..quadraticBezierTo(size.width * 0.5, size.height * 1.0, size.width, size.height * 0.9)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//
//     paint.color = Colors.blue;
//     canvas.drawPath(path4, paint);
//
//     final path5 = Path()
//       ..moveTo(0, size.height * 1.0)
//       ..lineTo(size.width, size.height * 1.0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//
//     paint.color = Colors.indigo;
//     canvas.drawPath(path5, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the app's primary theme color
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wave Animation Example'), // Title for the app bar
        ),
        body: WaveAnimation(),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue; // Animation value to control the wave height

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = Colors.green // Green color for the wave
      ..style = PaintingStyle.fill; // Filling the wave

    final pathGreen = Path();
    pathGreen.moveTo(0, size.height);
    pathGreen.lineTo(0, size.height * 0.6); // Starting point for the wave

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();
      final y = size.height * 0.56 +
          animationValue *
              30 *
              sin((i / size.width) * 3 * pi); // Calculate wave shape
      pathGreen.lineTo(x, y); // Define wave path
    }

    pathGreen.lineTo(size.width, size.height); // Complete the wave path
    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen); // Draw the green wave
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint the wave continuously
  }
}

class WaveAnimation extends StatefulWidget {
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // Synchronize animation with this widget
      duration: Duration(seconds: 2), // Animation duration
    )..repeat(reverse: true); // Repeat the animation back and forth
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context)
                  .size
                  .height), // Set the size of the custom paint
          painter: WavePainter(
              _controller.value), // Use the WavePainter to paint the wave
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
}
