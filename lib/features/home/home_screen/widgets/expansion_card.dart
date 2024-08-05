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
  String _formattedTime = '';
  String _formattedYear = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    setState(() {
      DateTime now = DateTime.now();
      _formattedYear = DateFormat('yyyy').format(now);
      _formattedDate = DateFormat('MM-dd').format(now);
      _formattedTime = DateFormat('kk:mm:ss').format(now);
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
          duration: const Duration(seconds: 2),
          curve: Curves.easeOut,
          height: _isExpanded ? 200 : 100,
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.red, width: 10)),
          child: SingleChildScrollView(
            child: _isExpanded
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ const Icon(
                      Icons.calendar_month,
                      color: Colors.red,
                      size: 30,
                    ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.red,
                        size: 30,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ),
          ),
        ),
      ),
    );
  }
}
