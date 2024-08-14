import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/containers/contact_us_container.dart';
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
    return const AppBarScreen(
      shouldBeCentered: false,
      shouldScroll: true,
      title: "Contact us",
      shouldHaveFloatingButton: false,
      children: [
        SizedBox(
          height: 30,
        ),
        Text("Get in touch"),
        Text(
            "If you have any question get in touch we are more than happy to help you"),
        ContactUsContainer(icon: Icons.phone, title: "+2712345678"),
        ContactUsContainer(
            icon: Icons.email, title: "TumiJanneSolution@gmail.com"),
        Text("Social Media"),
        Row(
          children: [Icon(Icons.facebook), Text("facebook name")],
        ),
        Row(
          children: [Icon(Icons.facebook), Text("facebook name")],
        ),
        Row(
          children: [Icon(Icons.facebook), Text("facebook name")],
        ),
      ],
    );
  }
}
