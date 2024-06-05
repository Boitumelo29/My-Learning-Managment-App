import 'package:flutter/material.dart';

class UserLayoutScreen extends StatefulWidget {
  const UserLayoutScreen({super.key});

  @override
  State<UserLayoutScreen> createState() => _UserLayoutScreenState();
}

class _UserLayoutScreenState extends State<UserLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
          ),
        ),
      ),
    );
  }
}
