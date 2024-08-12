import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AuthContainer(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(title),
      ),
      onTap: onPressed,
    );
  }
}
