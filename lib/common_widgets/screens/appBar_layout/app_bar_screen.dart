import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final bool shouldScroll;
  final String title;
  final List<Widget> children;
  final bool shouldHaveFloatingButton;
  final Function()? floatingButton;

   AppBarScreen({
    super.key,
    required this.shouldScroll,
    required this.title,
    required this.children, this.floatingButton,
    required this.shouldHaveFloatingButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        physics: shouldScroll
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
      floatingActionButton: shouldHaveFloatingButton ? FloatingActionButton(onPressed: floatingButton,) :null,
    );
  }
}
