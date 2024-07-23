import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/data/data_services/qoute_of_the_day_data_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   //QOTDataService.fetchData();
    return AppBarScreen(
      shouldBeCentered: true,
      shouldScroll: false,
      shouldHaveFloatingButton: false,
      title: 'Home Screen',
      children: [
        const Text("Hello world"),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Text("The Qoute of the day"),
        ),
        Text("Quote of the day in a container"),
        Text("Upcoming events"),
        Text("Jobs"),
      ],
    );
  }
}
