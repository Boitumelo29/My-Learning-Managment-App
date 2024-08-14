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
  final GlobalKey<ExpansionTileCardState> cardC = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
        shouldBeCentered: false,
        title: "Frequently Asked Questions",
        shouldScroll: true,
        shouldHaveFloatingButton: false,
        children: [
          ExpansionFaqTile(
              card: cardA,
              title: " What is MyLearning?",
              subTitle: "",
              children: const [
                Text(
                    "MyLearning is an innovative learning app designed to help users improve their skills through interactive lessons, quizzes, and personalized learning paths. Whether you’re a beginner or looking to advance your knowledge, our app caters to all levels.")
              ]),
          ExpansionFaqTile(
              card: cardB,
              title: "How do I sign up?",
              subTitle: "",
              children: const [
                Text(
                    "Signing up is easy! Simply download the app from the App Store or Google Play, open it, and follow the prompts to create an account using your email address or social media account")
              ]),
          ExpansionFaqTile(
              card: cardC,
              title: "Can I download courses for offline use?",
              subTitle: "",
              children: const [
                Text(
                    "Yes, you can download course materials to your device and access them offline. This feature is particularly useful if you’re traveling or have limited internet access.")
              ]),
          ExpansionFaqTile(
              card: cardD,
              title: "What should I do if I forget my password?",
              subTitle: "",
              children: const [
                Text(
                    "If you forget your password, click on the Forgot Password? link on the login screen. Follow the instructions to reset your password via email.")
              ]),
          ExpansionFaqTile(
              card: cardE,
              title: "How can I contact customer support?",
              subTitle: "",
              children: const [
                Text(
                    "If you need assistance, you can reach our customer support team by navigating to the “Help” section within the app or by sending an email to TumiJaneSolution@gmail.com. We’re here to help!")
              ]),
          ExpansionFaqTile(
              card: cardF,
              title: "How do I suggest new features or report a bug?",
              subTitle: "",
              children: const [
                Text(
                    "We value your feedback! To suggest new features or report bugs, navigate to the “Feedback” section in the app or email us directly at TumiJaneSolution@gmail.com")
              ]),
          ExpansionFaqTile(
              card: cardG,
              title: "Is there a community or forum for learners?",
              subTitle: "",
              children: const [
                Text(
                    "Yes! Join our vibrant community of learners by visiting the “Community” section in the app. Engage in discussions, share insights, and collaborate with fellow learners from around the world.")
              ]),
        ]);
  }
}
