import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        alignment: Alignment.center,
        'lib/assets/4.jpg',
        width: 200,
        height: 200,
      ),
    );
  }
}
