import 'package:flutter/material.dart';

class TrueOrFalseContainer extends StatelessWidget {
  final bool shouldBeRed;
  final Function() onTap;

  const TrueOrFalseContainer(
      {super.key, required this.shouldBeRed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(),
    );
  }
}
