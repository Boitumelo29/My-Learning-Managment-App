import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  const LongButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 380,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: isLoading
              ? const CircularProgressIndicator()
              : Center(child: Text(title))),
    );
  }
}
