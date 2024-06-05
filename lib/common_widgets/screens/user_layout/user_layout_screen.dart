import 'package:flutter/material.dart';

class UserLayoutScreen extends StatelessWidget {
  const UserLayoutScreen({super.key});

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
    ;
  }
}
