import 'package:flutter/material.dart';

class ShortCutContainer extends StatelessWidget {
  final IconData icon;
  final String title;

  const ShortCutContainer(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 760,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(
            title,
            style: const  TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          )
        ],
      ),
    );
  }
}
