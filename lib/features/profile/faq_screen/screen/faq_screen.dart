import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';

void main() => runApp(FAQScreen());

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      title: "Frequently Asked Questions",
      shouldScroll: true,
      shouldHaveFloatingButton: false,
      children: [
        ExpansionTileCard(
          key: cardA,
          leading: const CircleAvatar(
            child: Text("FAQ"),
          ),
          title: const Text("Who are we"),
          subtitle: const Text("What do we do?"),
          children: const [
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
        ExpansionTileCard(
          key: cardB,
          leading: const CircleAvatar(
            child: Text("FAQ"),
          ),
          title: const Text("Who are we"),
          subtitle: const Text("What do we do?"),
          children: const [
            Text("data"),
            Text("data"),
            Text("data"),
          ],
        ),
      ],
    );
  }
}
