import 'package:flutter/material.dart';

class SlideUpCard extends StatelessWidget {
  final dynamic children;
  final Color? mainColor;
  final Color? baseColor;
  final String title;
  final String description;
  final String? photo;
  final bool showIcon;
  final IconData? icon;

  const SlideUpCard(
      {super.key,
      this.children,
      this.mainColor,
      this.baseColor,
      required this.title,
      required this.description,
      this.photo,
      required this.showIcon,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    );
  }
}
