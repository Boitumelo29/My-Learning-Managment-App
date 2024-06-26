import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/rows/custom_setting_row.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/no_app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/features/profile/edit_profile/page/edit_profile.dart';
import 'package:mylearning/features/profile/settings/page/settings_page.dart';

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> toggleTheme;

  const ProfilePage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    List profileScreenDet = [
      {
        "icon": const Icon(Icons.person),
        "name": "Edit Profile",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const EditProfileScreen())
      },
      {
        "icon": const Icon(Icons.settings),
        "name": "Account settings",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) =>
                SettingsPage(isDarkMode: isDarkMode, toggleTheme: toggleTheme))
      },
      {
        "icon": const Icon(Icons.help),
        "name": "Help",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const ExamplePage())
      },
    ];

    return NoAppBarScreen(shouldScroll: false, children: [
      const Column(
        children: [Icon(Icons.person), SizedSpace(), Text("Name")],
      ),
      const SizedSpace(
        height: 40,
      ),
      ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: profileScreenDet.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var itm = profileScreenDet[index] as Map;
          return CustomSettingRow(
              icon: itm['icon'].icon,
              title: itm['name'],
              onTapped: () {
                if (itm['navigation'] != null) {
                  Navigator.push(context, itm['navigation']);
                }
              });
        },
      )
    ]);
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}


//boitumelo thobeja