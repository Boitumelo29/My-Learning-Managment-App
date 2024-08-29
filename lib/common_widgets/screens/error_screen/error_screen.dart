import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_rectangle_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Oops An Error has occurred!"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                alignment: Alignment.center,
                'lib/assets/4.jpg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LongRectangleButton(
                onTap: () {
                  Navigator.pop(context);
                },
                title: "Go Back")
          ],
        ),
      ),
    );
  }
}
