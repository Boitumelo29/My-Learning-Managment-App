import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class ExpansionCard extends StatefulWidget {
  const ExpansionCard({super.key});

  @override
  State<ExpansionCard> createState() => _ExpansionCardState();
}

class _ExpansionCardState extends State<ExpansionCard> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text(date.toString()),
      subtitle: Text(""),
      children: [],
    );
  }
}
