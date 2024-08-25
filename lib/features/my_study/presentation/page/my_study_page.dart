import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/containers/my_study_container.dart';
import 'package:mylearning/features/my_study/features/flash_cards/presenation/page/flashcards_page.dart';
import 'package:mylearning/features/my_study/features/multiple_choice/presntation/pages/multiple_choice_screen.dart';
import 'package:mylearning/features/my_study/features/true_or_false/presentation/page/true_or_false.dart';

class MyStudyPage extends StatefulWidget {
  const MyStudyPage({super.key});

  @override
  State<MyStudyPage> createState() => _MyStudyPageState();
}

class _MyStudyPageState extends State<MyStudyPage> {
  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldScroll: false,
      title: "My Study",
      shouldHaveFloatingButton: false,
      shouldBeCentered: true,
      children: [
        MyStudyContainer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const TrueOrFalsePage(),
                ),
              );
            },
            iconData: Icons.abc,
            title: "True Or False"),
        const SizedBox(
          height: 10,
        ),
        MyStudyContainer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const MultipleChoiceScreen(),
                ),
              );
            },
            iconData: Icons.abc,
            title: "Multiple Choice"),
        const SizedBox(
          height: 10,
        ),
        MyStudyContainer(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FlashCardScreen()));
            },
            iconData: Icons.abc,
            title: "Flip Card")
      ],
    );
  }
}
