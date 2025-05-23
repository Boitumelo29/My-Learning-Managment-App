import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/rows/custom_setting_row.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/no_app_bar_screen.dart';
import 'package:mylearning/common_widgets/screens/bottom_sheet_layout/bottom_sheet_modal.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/features/profile/contact_us/pages/contact_us.dart';
import 'package:mylearning/features/profile/edit_profile/page/edit_profile.dart';
import 'package:mylearning/features/profile/faq_screen/screen/faq_screen.dart';
import 'package:mylearning/features/profile/settings/page/settings_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfilePage extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleTheme;

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
        "name": "FAQ",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const FAQScreen())
      },
      {
        "icon": const Icon(Icons.phone),
        "name": "Contact us",
        "navigation": MaterialPageRoute(
            builder: (BuildContext context) => const ContactUsScreen())
      },
    ];

    return AppBarScreen(
      shouldBeCentered: false,
        shouldScroll: false,
        title: 'Profile',
        shouldHaveFloatingButton: false,
        children: [
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
