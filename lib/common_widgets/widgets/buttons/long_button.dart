import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const LongButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 380,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(40)),
          child: Center(child: Text(title))),
    );
  }
}
