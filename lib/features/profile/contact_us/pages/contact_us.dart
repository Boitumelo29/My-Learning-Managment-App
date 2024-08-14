import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/containers/contact_us_container.dart';
import 'package:mylearning/common_widgets/widgets/containers/social_media_conatiner.dart';
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
      shouldBeCentered: true,
      shouldScroll: true,
      title: "Contact us",
      shouldHaveFloatingButton: false,
      children: [
        SizedBox(
          height: 50,
        ),
        Text("Get in touch"),
        SizedBox(
          height: 10,
        ),
        Text(
            "If you have any enquires get in touch we are more than happy to help you"),
        SizedBox(
          height: 30,
        ),
        ContactUsContainer(icon: Icons.phone, title: "+2712345678"),
        SizedBox(
          height: 10,
        ),
        ContactUsContainer(
            icon: Icons.email, title: "TumiJanneSolution@gmail.com"),
        SizedBox(
          height: 40,
        ),
        Text("Social Media"),
        SizedBox(
          height: 30,
        ),
        SocialMediaContainer(
            icon: Icons.facebook,
            text: "bsvfhjdbgfjdhghjdgbjhdhsghjdgbjhbdsghbsbgdg"),
        SizedBox(
          height: 10,
        ),
        SocialMediaContainer(
            icon: Icons.facebook,
            text: "bsvfhjdbgfjdhghjdgbjhdhsghjdgbjhbdsghbsbgdg"),
        SizedBox(
          height: 10,
        ),
        SocialMediaContainer(
            icon: Icons.facebook,
            text: "bsvfhjdbgfjdhghjdgbjhdhsghjdgbjhbdsghbsbgdg"),
      ],
    );
  }
}
