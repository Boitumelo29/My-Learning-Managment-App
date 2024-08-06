import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';
import 'package:mylearning/data/data_services/qoute_of_the_day_data_service.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({super.key});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool _isExpanded = false;

  String _formattedDate = '';
  String _formattedTime = '';
  String _formattedYear = '';

  @override
  void initState() {
    super.initState();
    dataModel = QOTDataService.fetchData(context);
    _updateDateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    setState(() {
      DateTime now = DateTime.now();
      _formattedYear = DateFormat('yy').format(now);
      _formattedDate = DateFormat('MM-dd').format(now);
      _formattedTime = DateFormat('kk:mm').format(now);
    });
  }

  // @override
  // void dispose(){
  //   super.dispose();
  //   _updateDateTime();
  // }
  late Future<QOTDataModel> dataModel;
  QOTDataService dataService = QOTDataService();

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
            borderRadius: BorderRadius.circular(15)),
        child: SingleChildScrollView(
          child: _isExpanded
              ? isExpanded(context)
              : isNotExpanded(context)
        ) ,
      ),
    );
  }

  isExpanded(context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons. star,
              color: Colors.red,
              size: 30,
            ),
            Column(
              children: [
                Text(_formattedTime,
                    style: const TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _formattedDate,
                      style: const TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _formattedYear,
                      style: const TextStyle(fontSize: 40),
                    )
                  ],
                ),

              ],
            ),
          ],
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
                          const  Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Icon(Icons.format_quote_sharp),
                          ),
                          Text(
                            snapshot.data!.author,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                    Text(
                      snapshot.data!.body,
                      style: const TextStyle(
                          fontSize: 10, color: Colors.grey),
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
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
  isNotExpanded(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.star,
          color: Colors.red,
          size: 30,
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  _formattedDate,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  _formattedYear,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            Text(_formattedTime,
                style: const TextStyle(fontSize: 40)),
          ],
        ),
      ],
    );
  }
}
