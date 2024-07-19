import 'package:flutter/material.dart';

class AppBarScreen extends StatelessWidget {
  final bool shouldScroll;
  final String title;
  final List<Widget> children;
  final bool shouldHaveFloatingButton;
  final Function()? floatingActionButton;
  final String? tooltip;
  final IconData? icon;

  const AppBarScreen({
    super.key,
    required this.shouldScroll,
    required this.title,
    required this.children,
    this.floatingActionButton,
    required this.shouldHaveFloatingButton,
    this.tooltip,
    this.icon,
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
              children: children
            ),
          ),
        ),
      ),
      floatingActionButton: shouldHaveFloatingButton
          ? FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: floatingActionButton,
        tooltip: tooltip,
        child: Icon(icon),
      )
          : null,
    );
  }
}
