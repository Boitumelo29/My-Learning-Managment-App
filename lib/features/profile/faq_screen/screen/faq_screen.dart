import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/cards/expansion_faq_tile.dart';

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
        shouldBeCentered: false,
        title: "Frequently Asked Questions",
        shouldScroll: true,
        shouldHaveFloatingButton: false,
        children: [
          ExpansionFaqTile(
              card: cardA, title: "title", subTitle: "subTitle", children: []),
          ExpansionFaqTile(
              card: cardA, title: "title", subTitle: "subTitle", children: []),
          ExpansionFaqTile(
              card: cardA, title: "title", subTitle: "subTitle", children: []),
        ]);
  }
}
