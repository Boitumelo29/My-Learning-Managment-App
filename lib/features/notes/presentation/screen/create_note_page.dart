import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/containers/about_bio_container.dart';
import 'package:mylearning/util/validation/validation.dart';

class CreateNotePage extends StatelessWidget {
  CreateNotePage({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(shouldScroll: shouldScroll, title: title, children: children, shouldHaveFloatingButton: shouldHaveFloatingButton, shouldBeCentered: shouldBeCentered) ;
  }
}
