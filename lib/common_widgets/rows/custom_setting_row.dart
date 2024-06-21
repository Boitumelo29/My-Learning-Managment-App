import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';

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
    return SizedBox(
      height: 80,
      child: InkWell(
        onTap: onTapped,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedSpace(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 10),
            ),
            const SizedSpace(
              width: 200,
            ),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
