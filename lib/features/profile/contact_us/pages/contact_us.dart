import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/validation/validation.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldBeCentered: false,
      shouldScroll: true,
      title: "Contact us",
      shouldHaveFloatingButton: false,
      children: [
        Container(),
        Text("Get in touch"),
        Text("subtext"),
        LongTextFieldForm(
          isRed: false,
            onChanged: (value) {},
            hintText: "number",
            labelText: "number",
            showSuffixIcon: false,
            showPrefixIcon: true,
            prefixIcon: Icons.phone,
            validator: (value) {
              Validation.passwordValidation(value);
            },
            obsureText: kFlutterMemoryAllocationsEnabled), LongTextFieldForm(
          isRed: false,
            onChanged: (value) {},
            hintText: "email",
            labelText: "email",
            showSuffixIcon: false,
            showPrefixIcon: true,
            prefixIcon: Icons.email,
            validator: (value) {
              Validation.emailValidation(value);
            },
            obsureText: kFlutterMemoryAllocationsEnabled),
        Text("Social Media"),
       Row(children: [ Icon(Icons.facebook), Text("facebook name")],),
        Row(children: [ Icon(Icons.facebook), Text("facebook name")],),
        Row(children: [Icon(Icons.facebook), Text("facebook name")],),
      ],
    );
  }
}
