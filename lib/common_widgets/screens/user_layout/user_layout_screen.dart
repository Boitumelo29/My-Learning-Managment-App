import 'package:flutter/material.dart';

class UserLayoutScreen extends StatelessWidget {
  final dynamic children;

  const UserLayoutScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: children,
          ),
        ),
      ),
    );
  }
}
