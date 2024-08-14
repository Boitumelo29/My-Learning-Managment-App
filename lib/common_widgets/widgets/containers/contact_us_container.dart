import 'package:flutter/material.dart';

class ContactUsContainer extends StatelessWidget {
  final IconData icon;
  final String title;

  const ContactUsContainer(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon), Text(title)],
      ),
    );
  }
}
