import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/appBar_with_drawer.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';
import 'package:mylearning/data/data_services/qoute_of_the_day_data_service.dart';
import 'package:mylearning/features/profile/contact_us/pages/contact_us.dart';
import 'package:mylearning/features/profile/edit_profile/page/edit_profile.dart';
import 'package:mylearning/features/profile/faq_screen/screen/faq_screen.dart';
import 'package:skeleton_text/skeleton_text.dart';

import '../../../profile/settings/page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  late Future<QOTDataModel> dataModel;
  QOTDataService dataService = QOTDataService();

  @override
  void initState() {
    super.initState();
    dataModel = QOTDataService.fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    ///todo: we might need to use the orrifnal so we can acces the drawer
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
            accountEmail: const Text("Email testing"),
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
            // MaterialPageRoute(
            //     builder: (BuildContext context) =>
            //         SettingsPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme))
          },
          leading: const Icon(Icons.settings),
          title: const Text("Setting"),
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
          onTap: () {},
          leading: const Icon(Icons.exit_to_app),
          title: const Text("Logout"),
        ),
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
        Container(
          height: 150,
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 0.7),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: FutureBuilder<QOTDataModel>(
              future: dataModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.format_quote_sharp),
                            Text(
                              snapshot.data!.author,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Text(
                        snapshot.data!.body,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  );
                }
                return Center(
                  child: SkeletonAnimation(
                    child: Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const Text("Upcoming events"),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Column(
            children: [
              Icon(Icons.calendar_month),
              Text("upcoming events"),
              Text(
                  "when pressed it directs you to the upcoming events page // if none then its says no upcoming events"),
            ],
          )),
        ),
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
