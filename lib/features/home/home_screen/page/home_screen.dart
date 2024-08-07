import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/appBar_with_drawer.dart';
import 'package:mylearning/features/home/home_screen/widgets/expansion_card.dart';
import 'package:mylearning/features/home/home_screen/widgets/upcoming%20events.dart';
import 'package:mylearning/features/profile/contact_us/pages/contact_us.dart';
import 'package:mylearning/features/profile/edit_profile/page/edit_profile.dart';
import 'package:mylearning/features/profile/faq_screen/screen/faq_screen.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    var snackBar = const SnackBar(
      content: Text("action"),
      backgroundColor: Colors.red,
    );
    bool isYes = false;
    return AppBarDrawerScreen(
      shouldBeCentered: true,
      shouldScroll: true,
      shouldHaveFloatingButton: false,
      title: 'Home Screen',
      drawerChildren: [
        DrawerHeader(
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            currentAccountPicture: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
            accountName: const Text("Username"),
            accountEmail: Text("${user!.email}"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const EditProfileScreen()));
          },
          leading: const Icon(Icons.person),
          title: const Text("Edit profile"),
        ),
        SwitchListTile(
            title: const Text("Theme of app"),
            secondary: widget.isDarkMode
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.sunny),
            value: widget.isDarkMode,
            onChanged: (value) {
              widget.toggleTheme();
            }),
        SwitchListTile(
            title: const Text("Push Notifications"),
            secondary: const Icon(Icons.notifications_active),
            value: isYes,
            onChanged: (value) {
              //https://www.geeksforgeeks.org/videos/push-notification-in-flutter-using-firebase/?ref=header_outind
              //https://www.geeksforgeeks.org/how-to-add-local-notifications-in-flutter/?ref=header_outind
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const FAQScreen()));
          },
          leading: const Icon(Icons.help),
          title: const Text("FAQ"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ContactUsScreen()));
          },
          leading: const Icon(Icons.phone),
          title: const Text("Contact us"),
        ),
        ListTile(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
          },
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Logout"),
        ),
        // ListTile(
        //   onTap: () {
        //     ///Todo: stuff like the permui verison, app verison, adds
        //     // MaterialPageRoute(
        //     //     builder: (BuildContext context) =>
        //     //         SettingsPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme))
        //   },
        //   leading: const Icon(Icons.settings),
        //   title: const Text("Setting"),
        // ),
      ],
      children: [
        const Text("Hello UserName, welcome back!"),
        const Text("I think I want to change this to a carosle"),
        const Row(
          children: [
            Text("My Notes"),
            Text("My Chat bot"),
            Text("My Todos"),
          ],
        ),
        const ExpansionCard(),
        const SizedBox(
          height: 30,
        ),
        const UpcomingEvents(),
        const Text(
            "Chat bot but I might change this to a caroslue to display the notes, chat bot converstaion and someting else if possible  "),
        Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Column(
            children: [
              Icon(Icons.chat),
              Text("A chat bot instead will be try and hard but it can work")
              //Text("bursary finder here that will post the latest bursaries here"),
              //Text("Here is the link: https://www.zabursaries.co.za/general-bursaries-south-africa/capitec-bank-bursary/"),
              //Text("when pressed it directs you to the job spec details. we can also just redirect them to the job site"),
            ],
          )),
        ),
      ],
    );
  }
}
