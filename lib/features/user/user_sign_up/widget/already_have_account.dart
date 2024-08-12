import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final Function() onPressed;
  const AlreadyHaveAccount({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Already have an account? ",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "login",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
