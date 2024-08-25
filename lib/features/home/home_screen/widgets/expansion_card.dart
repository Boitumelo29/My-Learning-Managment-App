import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';
import 'package:mylearning/data/data_services/qoute_of_the_day_data_service.dart';
import 'package:mylearning/features/home/data/model/streak_model.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({super.key});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  Box<StreakModel>? streakBox;
  bool _isExpanded = false;
  late Timer _timer;
  late Future<QOTDataModel> dataModel;
  QOTDataService dataService = QOTDataService();

  @override
  void initState() {
    super.initState();
    dataModel = QOTDataService.fetchData(context);
    openBox();
    _timer = Timer.periodic(const Duration(seconds: 60), (Timer t) {
      setState(() {
        dataModel = QOTDataService.fetchData(context);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
        height: _isExpanded ? 230 : 130,
        width: 500,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          child: _isExpanded ? isExpanded(context) : isNotExpanded(context),
        ),
      ),
    );
  }

  Widget isExpanded(BuildContext context) {
    final streak = streakBox?.get('streak') ??
        StreakModel(streakDays: 0, lastUpdated: DateTime.now());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.circle, size: 60, color: Colors.white60),
            Icon(Icons.whatshot, size: 60, color: Colors.red),
          ],
        ),
        Text(
          '${streak.streakDays}',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Center(
          child: FutureBuilder<QOTDataModel>(
            future: dataModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.format_quote_sharp),
                        ),
                        Text(
                          snapshot.data!.author,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      snapshot.data!.body,
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                );
              }
              return Center(
                child: SkeletonAnimation(
                  child: Container(
                    width: 480,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget isNotExpanded(BuildContext context) {
    final streak = streakBox?.get('streak') ??
        StreakModel(streakDays: 0, lastUpdated: DateTime.now());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Circle Background
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const Positioned(
                  top: 10,
                  child: Icon(
                    Icons.whatshot,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                // Streak Number
                Positioned(
                  bottom: -10,
                  child: Text(
                    '${streak.streakDays}',
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Column(
              children: [Text("Week Streak"), Text("You are doing amazing!")],
            )
          ],
        )
      ],
    );
  }

  void openBox() async {
    streakBox = await Hive.openBox<StreakModel>('streakBox');
    checkAndUpdateStreak();
    setState(() {});
  }

  void checkAndUpdateStreak() {
    final currentDate = DateTime.now();
    final streak = streakBox?.get('streak') ??
        StreakModel(streakDays: 0, lastUpdated: DateTime.now());

    if (currentDate.difference(streak.lastUpdated).inDays >= 1) {
      if (currentDate.weekday == DateTime.monday ||
          currentDate.difference(streak.lastUpdated).inDays == 1) {
        streak.streakDays += 1;
      } else {
        streak.streakDays = 1; // Reset streak if a day is missed
      }
      streak.lastUpdated = currentDate;
      streakBox?.put('streak', streak);
    }
  }
}
