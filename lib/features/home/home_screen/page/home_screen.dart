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
        const Text("Hello UserName, welcome back!"),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Column(
            children: [
              Icon(Icons.format_quote_sharp),
              Text("The Quote of the day"),
            ],
          )),
        ),
        const Text("Upcoming events"),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Column(
            children: [
              Icon(Icons.calendar_month),
              Text("upcoming events"),
              Text("when pressed it directs you to the upcoming events page // if none then its says no upcoming events"),
            ],
          )),
        ),
        const Text("What is in the market"),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Column(
            children: [
              Icon(Icons.search),
              Text("random job posts for students"),
              Text("when pressed it directs you to the job spec details. we can also just redirect them to the job site"),
            ],
          )),
        ),
      ],
    );
  }
}
