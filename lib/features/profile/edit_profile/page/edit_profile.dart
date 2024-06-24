import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_rectangle_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/long_rectangle_textfield.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List gender = ["male", "female"];

  @override
  Widget build(BuildContext context) {
    int selectedIteIndex = 0;
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
      const SizedSpace(),
      CupertinoPicker(
        itemExtent: 40,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectedIteIndex = index;
          });
        },
        children: List<Widget>.generate(gender.length, (int index) {
          return Center(
            child: Text(gender[index]),
          );
        }),
      ),
      const SizedSpace(),
      LongRectangleButton(onTap: () {}, title: "Save")
    ]);
  }
}
