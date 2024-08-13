import 'package:flutter/material.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class MyLearningText extends StatelessWidget {
  const MyLearningText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      Strings.myLearning,
      style: TextStyle(color: Colors.red, fontSize: 40),
    );
  }
}
