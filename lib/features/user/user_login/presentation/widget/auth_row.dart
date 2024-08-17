import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/containers/auth_container.dart';

class AuthRow extends StatelessWidget {
  const AuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AuthContainer(
            title: "Google", onPressed: () {}, iconData: Icons.g_mobiledata),
        const SizedBox(
          width: 5,
        ),
        AuthContainer(
            title: "Facebook", onPressed: () {}, iconData: Icons.facebook)
      ],
    );
  }
}
