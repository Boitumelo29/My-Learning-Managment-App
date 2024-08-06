import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("action")));
      },
      child: Container(
        height: 100,
        width: 500,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [Text("date"), Text("time"), Text("Event time")],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
