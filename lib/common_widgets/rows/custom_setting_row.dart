import 'package:flutter/material.dart';

class CustomSettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTapped;

  const CustomSettingRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
