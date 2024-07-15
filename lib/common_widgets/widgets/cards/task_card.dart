import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Widget> children;

  const TaskCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.children});

  Widget build(BuildContext context) {
    return Card();
  }
}

class TaskkCard extends StatelessWidget {
  final String test;

  const TaskkCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
