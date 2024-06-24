import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/textfield/long_rectangle_textfield.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<String> gender = ["male", "female"];

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(title: "Edit Profile", shouldScroll: true, children: [
      const Center(
        child: Column(
          children: [
            Icon(
              Icons.person,
              size: 40,
            ),
            Text("Change Image"),
          ],
        ),
      ),
      const SizedSpace(),
      LongRectangleTextField(
        hintText: Strings.username,
        labelText: Strings.username,
        showPrefixIcon: true,
        onChanged: (value) {},
      ),
      const SizedSpace(),
      LongRectangleTextField(
        hintText: Strings.username,
        labelText: Strings.username,
        showPrefixIcon: true,
        onChanged: (value) {},
      ),

      ///gender
      ///
    ]);
  }
}
