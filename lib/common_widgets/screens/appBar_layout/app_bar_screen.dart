import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final bool shouldScroll;
  final String title;
  final List<Widget> children;

  const AppBarScreen({
    super.key,
    required this.shouldScroll,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: shouldScroll
                ? ListView(
                    physics: const ScrollPhysics(),
                  )
                : Column(),
          ),
        ));
  }
}
