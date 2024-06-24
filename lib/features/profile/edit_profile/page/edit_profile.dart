import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppBarScreen(
        title: "Edit Profile",
        shouldScroll: true,
        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  size: 40,
                ),
                Text("Change Image")
              ],
            ),
          ),
        ]);
  }
}
