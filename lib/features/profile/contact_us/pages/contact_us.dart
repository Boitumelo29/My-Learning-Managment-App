import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/containers/contact_us_container.dart';
import 'package:mylearning/common_widgets/widgets/containers/social_media_conatiner.dart';

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
        Text(
          "Get in touch",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "If you have any enquires get in touch we are more than happy to help you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ContactUsContainer(icon: Icons.phone, title: "+2712345678"),
        SizedBox(
          height: 20,
        ),
        ContactUsContainer(
            icon: Icons.email, title: "TumiJanneSolution@gmail.com"),
        SizedBox(
          height: 40,
        ),
        Text(
          "Social Media",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        SocialMediaContainer(
            icon: Icons.facebook,
            text: "Stay updated, connect, with us."),
        SizedBox(
          height: 10,
        ),
        SocialMediaContainer(
            icon: Icons.camera,
            text:
                "Explore our visual world."),
        SizedBox(
          height: 10,
        ),
        SocialMediaContainer(
            icon: Icons.web, text: "www.tumijanesolution.co.za"),
      ],
    );
  }
}
