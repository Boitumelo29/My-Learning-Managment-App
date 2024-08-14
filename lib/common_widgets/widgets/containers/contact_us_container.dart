import 'package:flutter/material.dart';

class ContactUsContainer extends StatelessWidget {
  final IconData icon;
  final String title;

  const ContactUsContainer(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
     //   bo
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
