import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/containers/auth_container.dart';

class AuthRow extends StatelessWidget {
  const AuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthContainer(
            title: "Google", onPressed: () {}, iconData: Icons.g_mobiledata),
        const SizedBox(
          width: 10,
        ),
        AuthContainer(
            title: "Facebook", onPressed: () {}, iconData: Icons.facebook)
      ],
    );
  }
}
