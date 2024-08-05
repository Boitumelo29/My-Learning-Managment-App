import 'dart:async';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpansionCard extends StatefulWidget {
  const ExpansionCard({super.key});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  bool _isExpanded = false;

  String _formattedDate = '';

  @override
  void initState() {
    super.initState();
    _formattedDate = _getCurrentDateTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  String _getCurrentDateTime() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd – kk:mm:ss').format(now);
  }

  void _updateDateTime() {
    setState(() {
      _formattedDate = _getCurrentDateTime();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 700),
          curve: Curves.easeOut,
          height: _isExpanded ? 200 : 100,
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.red[50],),
          child: SingleChildScrollView(
            child: _isExpanded
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.calendar_month),
                      Column(children: [Text("$_formattedDate"),
                      Text("Time"),
                        Icon(Icons.sunny)
                      ],)
                    ],
                  )
                : Column(
                    children: [Text("data")],
                  ),
          ),
        ),
      ),
    );
  }
}
