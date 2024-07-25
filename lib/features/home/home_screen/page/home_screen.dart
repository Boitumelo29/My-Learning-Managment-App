import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';
import 'package:mylearning/data/data_services/qoute_of_the_day_data_service.dart';

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
    return AppBarScreen(
      shouldBeCentered: true,
      shouldScroll: false,
      shouldHaveFloatingButton: false,
      title: 'Home Screen',
      children: [
        const Text("Hello UserName, welcome back!"),
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
                      Text(
                        snapshot.data!.author,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.format_quote_sharp),
                            Text(
                              snapshot.data!.body,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            ),
                          ]),
                    ],
                  );
                }
                return const CircularProgressIndicator();
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
        const Text("What is in the market"),
        Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: const Center(
              child: Column(
            children: [
              Icon(Icons.search),
              Text(
                  "bursary finder here that will post the latest bursaries here"),
              Text(
                  "Here is the link: https://www.zabursaries.co.za/general-bursaries-south-africa/capitec-bank-bursary/"),
              Text(
                  "when pressed it directs you to the job spec details. we can also just redirect them to the job site"),
            ],
          )),
        ),
      ],
    );
  }
}
