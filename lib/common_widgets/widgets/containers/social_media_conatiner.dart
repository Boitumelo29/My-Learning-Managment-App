import 'package:flutter/material.dart';

class SocialMediaContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const SocialMediaContainer(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [const Icon(Icons.circle), Icon(icon)],
        ),
       const  SizedBox(width: 30,)
      ],
    );
  }
}
