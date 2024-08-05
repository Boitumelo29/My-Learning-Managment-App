import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("action")));
      },
      
    );
  }
}
